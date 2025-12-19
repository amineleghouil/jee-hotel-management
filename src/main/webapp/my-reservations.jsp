<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.hotel.model.Reservation" %>
        <%@ page import="com.hotel.model.User" %>
            <%@ page import="java.util.List" %>
                <jsp:include page="includes/header.jsp">
                    <jsp:param name="title" value="My Reservations - LuxeStay" />
                </jsp:include>

                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                    <div class="sm:flex sm:items-center sm:justify-between mb-8">
                        <div>
                            <% User currentUser=(User) session.getAttribute("user"); boolean isAdmin=currentUser !=null
                                && "ADMIN" .equals(currentUser.getRole()); %>
                                <h1 class="text-3xl font-bold text-white">
                                    <%= isAdmin ? "All Reservations" : "My Reservations" %>
                                </h1>
                                <p class="mt-2 text-slate-300">
                                    <%= isAdmin ? "Manage all hotel reservations" : "View and manage your stays with us"
                                        %>
                                </p>
                        </div>
                        <% if (!isAdmin) { %>
                            <div class="mt-4 sm:mt-0">
                                <a href="rooms"
                                    class="inline-flex items-center px-6 py-3 border border-transparent rounded-xl shadow-lg text-sm font-bold text-white bg-gradient-to-r from-primary-600 to-indigo-600 hover:from-primary-700 hover:to-indigo-700 transition transform hover:-translate-y-0.5">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                    </svg>
                                    Book New Stay
                                </a>
                            </div>
                            <% } %>
                    </div>

                    <div class="glass rounded-2xl shadow-2xl overflow-hidden">
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-slate-200">
                                <thead class="bg-gradient-to-r from-slate-50 to-slate-100">
                                    <tr>
                                        <th
                                            class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                            ID
                                        </th>
                                        <th
                                            class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                            Room
                                        </th>
                                        <th
                                            class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                            Dates
                                        </th>
                                        <th
                                            class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                            Status
                                        </th>
                                        <% if (isAdmin) { %>
                                            <th
                                                class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                                Guest
                                            </th>
                                            <% } %>
                                                <th
                                                    class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                                    Actions
                                                </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-slate-100">
                                    <% List<Reservation> reservations = (List<Reservation>)
                                            request.getAttribute("reservations");
                                            if (reservations != null && !reservations.isEmpty()) {
                                            for (Reservation res : reservations) {
                                            %>
                                            <tr class="hover:bg-slate-50 transition">
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <span class="text-sm font-bold text-primary-600">#<%= res.getId() %>
                                                            </span>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <div class="flex items-center">
                                                        <div
                                                            class="flex-shrink-0 h-12 w-12 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-xl flex items-center justify-center text-white font-bold shadow-md">
                                                            <%= res.getRoom().getRoomNumber() %>
                                                        </div>
                                                        <div class="ml-4">
                                                            <div class="text-sm font-bold text-slate-900">Room <%=
                                                                    res.getRoom().getRoomNumber() %>
                                                            </div>
                                                            <div class="text-xs text-slate-500">
                                                                <%= res.getRoom().getDescription() %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <div class="text-sm font-semibold text-slate-900">
                                                        <%= res.getStartDate() %>
                                                    </div>
                                                    <div class="text-xs text-slate-500">to <%= res.getEndDate() %>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <% String status=res.getStatus(); String badgeClass="" ; if
                                                        ("CONFIRMED".equals(status)) {
                                                        badgeClass="bg-green-100 text-green-800" ; } else if
                                                        ("CANCELLED".equals(status)) {
                                                        badgeClass="bg-red-100 text-red-800" ; } else {
                                                        badgeClass="bg-gray-100 text-gray-800" ; } %>
                                                        <span
                                                            class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full <%= badgeClass %>">
                                                            <%= status %>
                                                        </span>
                                                </td>
                                                <% if (isAdmin) { %>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm text-slate-600 font-medium">
                                                        <%= res.getUser().getUsername() %>
                                                    </td>
                                                    <% } %>
                                                        <td
                                                            class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                            <% if (!"CANCELLED".equals(res.getStatus())) { %>
                                                                <form action="my-reservations" method="post"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="action" value="cancel">
                                                                    <input type="hidden" name="id"
                                                                        value="<%= res.getId() %>">
                                                                    <button type="submit"
                                                                        class="inline-flex items-center px-4 py-2 bg-red-500 text-white text-xs font-bold rounded-lg hover:bg-red-600 transition shadow-md"
                                                                        onclick="return confirm('Are you sure you want to cancel this reservation?');">
                                                                        <svg class="w-4 h-4 mr-1" fill="none"
                                                                            stroke="currentColor" viewBox="0 0 24 24">
                                                                            <path stroke-linecap="round"
                                                                                stroke-linejoin="round" stroke-width="2"
                                                                                d="M6 18L18 6M6 6l12 12"></path>
                                                                        </svg>
                                                                        Cancel
                                                                    </button>
                                                                </form>
                                                                <% } else { %>
                                                                    <span class="text-xs text-slate-400">No
                                                                        actions</span>
                                                                    <% } %>
                                                        </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="<%= isAdmin ? " 6" : "5" %>" class="px-6 py-16
                                                        text-center">
                                                        <div class="flex flex-col items-center">
                                                            <svg class="h-20 w-20 text-slate-300 mb-4" fill="none"
                                                                stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2"
                                                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                                                </path>
                                                            </svg>
                                                            <p class="text-lg font-bold text-slate-900 mb-2">No
                                                                reservations found</p>
                                                            <p class="text-sm text-slate-500 mb-6">Start your luxury
                                                                experience today</p>
                                                            <% if (!isAdmin) { %>
                                                                <a href="rooms"
                                                                    class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-primary-600 to-indigo-600 text-white font-bold rounded-xl hover:from-primary-700 hover:to-indigo-700 transition shadow-lg">
                                                                    Book your first stay
                                                                    <svg class="w-4 h-4 ml-2" fill="none"
                                                                        stroke="currentColor" viewBox="0 0 24 24">
                                                                        <path stroke-linecap="round"
                                                                            stroke-linejoin="round" stroke-width="2"
                                                                            d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                                                                    </svg>
                                                                </a>
                                                                <% } %>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <jsp:include page="includes/footer.jsp" />