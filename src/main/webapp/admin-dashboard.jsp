<jsp:include page="/includes/header.jsp">
    <jsp:param name="title" value="Admin Dashboard - LuxeStay" />
</jsp:include>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Header Section -->
    <div class="mb-8">
        <h1 class="text-4xl font-bold text-white mb-2">Admin Dashboard</h1>
        <p class="text-slate-300">Manage your hotel operations efficiently.</p>
    </div>

    <!-- Stats Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
        <!-- Total Users -->
        <div
            class="bg-gradient-to-br from-blue-500 to-blue-600 p-6 rounded-2xl shadow-2xl text-white transform hover:scale-105 transition duration-300">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-blue-100 text-sm font-medium mb-1">Total Users</p>
                    <p class="text-4xl font-bold">${totalUsers}</p>
                </div>
                <div class="p-4 bg-white/20 rounded-xl backdrop-blur">
                    <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z">
                        </path>
                    </svg>
                </div>
            </div>
        </div>

        <!-- Total Rooms -->
        <div
            class="bg-gradient-to-br from-indigo-500 to-indigo-600 p-6 rounded-2xl shadow-2xl text-white transform hover:scale-105 transition duration-300">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-indigo-100 text-sm font-medium mb-1">Total Rooms</p>
                    <p class="text-4xl font-bold">${totalRooms}</p>
                </div>
                <div class="p-4 bg-white/20 rounded-xl backdrop-blur">
                    <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                        </path>
                    </svg>
                </div>
            </div>
        </div>

        <!-- Total Reservations -->
        <div
            class="bg-gradient-to-br from-emerald-500 to-emerald-600 p-6 rounded-2xl shadow-2xl text-white transform hover:scale-105 transition duration-300">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-emerald-100 text-sm font-medium mb-1">Reservations</p>
                    <p class="text-4xl font-bold">${totalReservations}</p>
                </div>
                <div class="p-4 bg-white/20 rounded-xl backdrop-blur">
                    <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                        </path>
                    </svg>
                </div>
            </div>
        </div>

        <!-- Revenue -->
        <div
            class="bg-gradient-to-br from-amber-500 to-amber-600 p-6 rounded-2xl shadow-2xl text-white transform hover:scale-105 transition duration-300">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-amber-100 text-sm font-medium mb-1">Total Revenue</p>
                    <p class="text-4xl font-bold">$${formattedRevenue}</p>
                </div>
                <div class="p-4 bg-white/20 rounded-xl backdrop-blur">
                    <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                        </path>
                    </svg>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-12">
        <a href="${pageContext.request.contextPath}/admin/users"
            class="glass p-8 rounded-2xl shadow-xl hover:shadow-2xl transition duration-300 group">
            <div class="flex items-center space-x-4">
                <div class="p-4 bg-blue-100 rounded-xl group-hover:bg-blue-200 transition">
                    <svg class="h-8 w-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z">
                        </path>
                    </svg>
                </div>
                <div>
                    <h3 class="text-lg font-bold text-white">Manage Users</h3>
                    <p class="text-slate-400 text-sm">View and manage all users</p>
                </div>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/my-reservations"
            class="glass p-8 rounded-2xl shadow-xl hover:shadow-2xl transition duration-300 group">
            <div class="flex items-center space-x-4">
                <div class="p-4 bg-emerald-100 rounded-xl group-hover:bg-emerald-200 transition">
                    <svg class="h-8 w-8 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2">
                        </path>
                    </svg>
                </div>
                <div>
                    <h3 class="text-lg font-bold text-white">View Reservations</h3>
                    <p class="text-slate-400 text-sm">Check all bookings</p>
                </div>
            </div>
        </a>

        <button onclick="document.getElementById('addRoomModal').classList.remove('hidden')"
            class="glass p-8 rounded-2xl shadow-xl hover:shadow-2xl transition duration-300 group text-left">
            <div class="flex items-center space-x-4">
                <div class="p-4 bg-indigo-100 rounded-xl group-hover:bg-indigo-200 transition">
                    <svg class="h-8 w-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                    </svg>
                </div>
                <div>
                    <h3 class="text-lg font-bold text-white">Add Room</h3>
                    <p class="text-slate-400 text-sm">Create new room listing</p>
                </div>
            </div>
        </button>
    </div>

    <!-- Rooms Management -->
    <div class="glass rounded-2xl shadow-2xl p-8 mb-8">
        <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-white">Room Management</h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <%@ page import="com.hotel.model.Room" %>
                <%@ page import="java.util.List" %>
                    <% List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                            if (rooms != null && !rooms.isEmpty()) {
                            for (Room room : rooms) {
                            %>
                            <div class="bg-slate-50 rounded-xl p-6 relative group hover:shadow-lg transition">
                                <!-- Action Buttons -->
                                <div class="absolute top-4 right-4 flex space-x-2">
                                    <button data-id="<%= room.getId() %>" data-number="<%= room.getRoomNumber() %>"
                                        data-capacity="<%= room.getCapacity() %>"
                                        data-price="<%= room.getPricePerNight() %>"
                                        data-description="<%= room.getDescription() %>" onclick="openEditModal(this)"
                                        class="p-2 bg-blue-500 rounded-lg text-white hover:bg-blue-600 transition shadow-md">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                                            </path>
                                        </svg>
                                    </button>
                                    <form action="${pageContext.request.contextPath}/rooms" method="post"
                                        class="inline">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="<%= room.getId() %>">
                                        <button type="submit" onclick="return confirm('Delete this room?')"
                                            class="p-2 bg-red-500 rounded-lg text-white hover:bg-red-600 transition shadow-md">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                                </path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>

                                <div class="mb-4">
                                    <h3 class="text-lg font-bold text-slate-900">Room <%= room.getRoomNumber() %>
                                    </h3>
                                    <p class="text-sm text-slate-600 mt-1">
                                        <%= room.getDescription() %>
                                    </p>
                                </div>

                                <div class="flex items-center justify-between">
                                    <span class="text-xl font-bold text-primary-600">$<%= room.getPricePerNight() %>
                                            /night</span>
                                    <span class="text-sm text-slate-600">
                                        <%= room.getCapacity() %> guests
                                    </span>
                                </div>
                            </div>
                            <% } } %>
        </div>
    </div>
</div>

<!-- Add/Edit Room Modal -->
<div id="addRoomModal" class="fixed inset-0 z-50 hidden overflow-y-auto bg-slate-900/80 backdrop-blur-sm"
    onclick="if(event.target === this) closeModal()">
    <div class="flex items-center justify-center min-h-screen p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-md w-full p-8" onclick="event.stopPropagation()">
            <h3 class="text-2xl font-bold text-slate-900 mb-6" id="modalTitle">Add New Room</h3>
            <form action="${pageContext.request.contextPath}/rooms" method="post" class="space-y-4">
                <input type="hidden" name="action" id="roomAction" value="add">
                <input type="hidden" name="id" id="roomId">

                <div>
                    <label class="block text-sm font-bold text-slate-700 mb-2">Room Number</label>
                    <input type="text" name="roomNumber" id="roomNumber" required
                        class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                </div>
                <div>
                    <label class="block text-sm font-bold text-slate-700 mb-2">Capacity</label>
                    <input type="number" name="capacity" id="capacity" required
                        class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                </div>
                <div>
                    <label class="block text-sm font-bold text-slate-700 mb-2">Price Per Night ($)</label>
                    <input type="number" step="0.01" name="price" id="price" required
                        class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                </div>
                <div>
                    <label class="block text-sm font-bold text-slate-700 mb-2">Description</label>
                    <textarea name="description" id="description" rows="3" required
                        class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent"></textarea>
                </div>
                <div class="flex space-x-3 pt-4">
                    <button type="submit" id="submitBtn"
                        class="flex-1 bg-gradient-to-r from-primary-600 to-indigo-600 text-white font-bold py-3 rounded-xl hover:from-primary-700 hover:to-indigo-700 transition shadow-lg">
                        Add Room
                    </button>
                    <button type="button" onclick="closeModal()"
                        class="px-6 bg-slate-200 text-slate-700 font-semibold py-3 rounded-xl hover:bg-slate-300 transition">
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openEditModal(btn) {
        document.getElementById('modalTitle').innerText = 'Edit Room';
        document.getElementById('roomAction').value = 'edit';
        document.getElementById('roomId').value = btn.dataset.id;
        document.getElementById('roomNumber').value = btn.dataset.number;
        document.getElementById('capacity').value = btn.dataset.capacity;
        document.getElementById('price').value = btn.dataset.price;
        document.getElementById('description').value = btn.dataset.description;
        document.getElementById('submitBtn').innerText = 'Update Room';
        document.getElementById('addRoomModal').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('addRoomModal').classList.add('hidden');
        document.getElementById('modalTitle').innerText = 'Add New Room';
        document.getElementById('roomAction').value = 'add';
        document.getElementById('roomId').value = '';
        document.getElementById('roomNumber').value = '';
        document.getElementById('capacity').value = '';
        document.getElementById('price').value = '';
        document.getElementById('description').value = '';
        document.getElementById('submitBtn').innerText = 'Add Room';
    }
</script>

<jsp:include page="/includes/footer.jsp" />