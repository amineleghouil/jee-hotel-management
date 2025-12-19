<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.hotel.model.Room" %>
        <%@ page import="java.util.List" %>
            <jsp:include page="includes/header.jsp">
                <jsp:param name="title" value="Available Rooms - LuxeStay" />
            </jsp:include>

            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                <!-- Page Header -->
                <div class="mb-12 text-center">
                    <h1 class="text-4xl md:text-5xl font-extrabold text-white tracking-tight mb-4">
                        <span
                            class="bg-clip-text text-transparent bg-gradient-to-r from-white via-slate-200 to-slate-300">
                            Discover Your Perfect Stay
                        </span>
                    </h1>
                    <p class="text-lg text-slate-300 max-w-2xl mx-auto">
                        Browse our selection of luxury rooms and suites, each designed to provide you with
                        an unforgettable experience.
                    </p>
                </div>

                <!-- Rooms Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <% List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                            if (rooms != null && !rooms.isEmpty()) {
                            for (Room room : rooms) {
                            %>
                            <div
                                class="group glass rounded-2xl overflow-hidden shadow-2xl transition-all duration-500 hover:shadow-primary-500/20 transform hover:-translate-y-2 flex flex-col h-full">

                                <!-- Room Image -->
                                <div
                                    class="relative h-56 overflow-hidden bg-gradient-to-br from-slate-200 to-slate-300">
                                    <img src="https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                                        alt="Room <%= room.getRoomNumber() %>"
                                        class="w-full h-full object-cover transform group-hover:scale-110 transition duration-700">

                                    <!-- Price Badge -->
                                    <div
                                        class="absolute top-4 right-4 bg-gradient-to-r from-primary-600 to-indigo-600 text-white px-4 py-2 rounded-full shadow-lg backdrop-blur-sm">
                                        <span class="text-2xl font-bold">$<%= room.getPricePerNight() %></span>
                                        <span class="text-xs font-normal text-primary-100 ml-1">/ night</span>
                                    </div>

                                    <!-- Room Number Badge -->
                                    <div
                                        class="absolute bottom-4 left-4 bg-slate-900/80 backdrop-blur text-white px-3 py-1 rounded-full text-sm font-semibold">
                                        Room <%= room.getRoomNumber() %>
                                    </div>
                                </div>

                                <!-- Card Content -->
                                <div class="p-6 flex-grow flex flex-col bg-white">
                                    <!-- Capacity Info -->
                                    <div class="flex items-center text-slate-600 mb-4">
                                        <div class="flex items-center bg-slate-100 rounded-full px-3 py-1">
                                            <svg class="w-5 h-5 mr-2 text-primary-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z">
                                                </path>
                                            </svg>
                                            <span class="text-sm font-semibold">
                                                <%= room.getCapacity() %> Guests
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <p class="text-slate-600 mb-6 flex-grow leading-relaxed">
                                        <%= room.getDescription() %>
                                    </p>

                                    <!-- Amenities Icons -->
                                    <div class="flex items-center space-x-4 mb-6 text-slate-400">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                            title="WiFi">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0">
                                            </path>
                                        </svg>
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                            title="TV">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z">
                                            </path>
                                        </svg>
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                            title="AC">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z">
                                            </path>
                                        </svg>
                                    </div>

                                    <!-- Book Button -->
                                    <form action="book" method="get" class="mt-auto">
                                        <input type="hidden" name="roomId" value="<%= room.getId() %>">
                                        <button type="submit"
                                            class="w-full bg-gradient-to-r from-slate-900 to-slate-800 text-white font-bold py-4 px-6 rounded-xl hover:from-primary-600 hover:to-indigo-600 transition-all duration-300 flex items-center justify-center shadow-lg group-hover:shadow-xl transform hover:scale-105">
                                            <span>Reserve Now</span>
                                            <svg class="w-5 h-5 ml-2 transform group-hover:translate-x-1 transition-transform"
                                                fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <% } } else { %>
                                <!-- Empty State -->
                                <div class="col-span-3 text-center py-20">
                                    <svg class="mx-auto h-24 w-24 text-slate-400" fill="none" stroke="currentColor"
                                        viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                                        </path>
                                    </svg>
                                    <h3 class="mt-4 text-xl font-semibold text-white">No Rooms Available</h3>
                                    <p class="mt-2 text-slate-400">Check back later for availability.</p>
                                </div>
                                <% } %>
                </div>
            </div>

            <jsp:include page="includes/footer.jsp" />