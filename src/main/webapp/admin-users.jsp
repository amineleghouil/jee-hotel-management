<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.hotel.model.User" %>
        <%@ page import="java.util.List" %>
            <jsp:include page="/includes/header.jsp">
                <jsp:param name="title" value="Manage Users - LuxeStay" />
            </jsp:include>

            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                <div class="sm:flex sm:items-center sm:justify-between mb-8">
                    <div>
                        <h1 class="text-3xl font-bold text-white">User Management</h1>
                        <p class="mt-2 text-slate-300">View and manage registered users.</p>
                    </div>
                    <div class="flex items-center space-x-4">
                        <button onclick="document.getElementById('addUserModal').classList.remove('hidden')"
                            class="mt-4 sm:mt-0 inline-flex items-center px-6 py-3 bg-gradient-to-r from-primary-600 to-indigo-600 text-white font-bold rounded-xl hover:from-primary-700 hover:to-indigo-700 transition shadow-lg">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 4v16m8-8H4"></path>
                            </svg>
                            Add User
                        </button>

                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                            class="mt-4 sm:mt-0 inline-flex items-center px-6 py-3 bg-slate-700 text-white font-bold rounded-xl hover:bg-slate-600 transition shadow-lg">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                            </svg>
                            Back to Dashboard
                        </a>
                    </div>
                </div>

                <div class="glass rounded-2xl shadow-2xl overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-slate-200">
                            <thead class="bg-gradient-to-r from-slate-50 to-slate-100">
                                <tr>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        ID</th>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        User</th>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        Role</th>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        Email</th>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        Phone</th>
                                    <th
                                        class="px-6 py-4 text-left text-xs font-bold text-slate-700 uppercase tracking-wider">
                                        Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-slate-100">
                                <% User currentUser=(User) session.getAttribute("user"); List<User> users = (List<User>)
                                        request.getAttribute("users");
                                        if (users != null && !users.isEmpty()) {
                                        for (User u : users) {
                                        %>
                                        <tr class="hover:bg-slate-50 transition">
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <span class="text-sm font-bold text-primary-600">#<%= u.getId() %>
                                                </span>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <div
                                                        class="flex-shrink-0 h-12 w-12 bg-gradient-to-br from-primary-500 to-indigo-600 rounded-full flex items-center justify-center text-white font-bold shadow-md text-lg">
                                                        <%= u.getUsername().substring(0, 1).toUpperCase() %>
                                                    </div>
                                                    <div class="ml-4">
                                                        <div class="text-sm font-bold text-slate-900">
                                                            <%= u.getUsername() %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <% String roleClass="ADMIN" .equals(u.getRole())
                                                    ? "bg-purple-100 text-purple-800" : "bg-gray-100 text-gray-800" ; %>
                                                    <span
                                                        class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full <%= roleClass %>">
                                                        <%= u.getRole() %>
                                                    </span>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                                                <%= u.getEmail() !=null ? u.getEmail() : "N/A" %>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                                                <%= u.getPhoneNumber() !=null ? u.getPhoneNumber() : "N/A" %>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                <% if (!u.getId().equals(currentUser.getId())) { %>
                                                    <form action="${pageContext.request.contextPath}/admin/users"
                                                        method="post" style="display:inline;">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="id" value="<%= u.getId() %>">
                                                        <button type="submit"
                                                            class="inline-flex items-center px-4 py-2 bg-red-500 text-white text-xs font-bold rounded-lg hover:bg-red-600 transition shadow-md"
                                                            onclick="return confirm('Are you sure you want to delete this user?');">
                                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor"
                                                                viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2"
                                                                    d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                                                </path>
                                                            </svg>
                                                            Delete
                                                        </button>
                                                    </form>
                                                    <% } else { %>
                                                        <span class="text-xs text-slate-400">Current User</span>
                                                        <% } %>
                                            </td>
                                        </tr>
                                        <% } } else { %>
                                            <tr>
                                                <td colspan="6" class="px-6 py-16 text-center text-slate-500">
                                                    <p class="text-lg font-semibold">No users found</p>
                                                </td>
                                            </tr>
                                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Add User Modal -->
            <div id="addUserModal" class="fixed inset-0 z-50 hidden overflow-y-auto bg-slate-900/80 backdrop-blur-sm"
                onclick="if(event.target === this) document.getElementById('addUserModal').classList.add('hidden')">
                <div class="flex items-center justify-center min-h-screen p-4">
                    <div class="bg-white rounded-2xl shadow-2xl max-w-md w-full p-8" onclick="event.stopPropagation()">
                        <h3 class="text-2xl font-bold text-slate-900 mb-6">Add New User</h3>
                        <form action="${pageContext.request.contextPath}/admin/users" method="post" class="space-y-4">
                            <input type="hidden" name="action" value="add">

                            <div>
                                <label class="block text-sm font-bold text-slate-700 mb-2">Username</label>
                                <input type="text" name="username" required
                                    class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-bold text-slate-700 mb-2">Password</label>
                                <input type="password" name="password" required
                                    class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-bold text-slate-700 mb-2">Role</label>
                                <select name="role" required
                                    class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                                    <option value="USER">User</option>
                                    <option value="ADMIN">Admin</option>
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-bold text-slate-700 mb-2">Email</label>
                                <input type="email" name="email"
                                    class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-bold text-slate-700 mb-2">Phone Number</label>
                                <input type="tel" name="phoneNumber"
                                    class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                            </div>

                            <div class="flex space-x-3 pt-4">
                                <button type="submit"
                                    class="flex-1 bg-gradient-to-r from-primary-600 to-indigo-600 text-white font-bold py-3 rounded-xl hover:from-primary-700 hover:to-indigo-700 transition shadow-lg">
                                    Create User
                                </button>
                                <button type="button"
                                    onclick="document.getElementById('addUserModal').classList.add('hidden')"
                                    class="px-6 bg-slate-200 text-slate-700 font-semibold py-3 rounded-xl hover:bg-slate-300 transition">
                                    Cancel
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <jsp:include page="/includes/footer.jsp" />