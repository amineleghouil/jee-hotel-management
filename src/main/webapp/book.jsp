<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.hotel.model.Room" %>
        <%@ page import="com.hotel.dao.RoomDao" %>
            <jsp:include page="includes/header.jsp">
                <jsp:param name="title" value="Book Room - LuxeStay" />
            </jsp:include>

            <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                <div class="glass rounded-2xl shadow-2xl overflow-hidden">
                    <!-- Header -->
                    <div class="bg-gradient-to-r from-slate-900 to-slate-800 px-8 py-6">
                        <h2 class="text-3xl font-bold text-white flex items-center">
                            <svg class="w-8 h-8 mr-3 text-primary-400" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                </path>
                            </svg>
                            Complete Your Reservation
                        </h2>
                        <p class="text-slate-300 mt-2">Select your dates and confirm your luxury stay</p>
                    </div>

                    <div class="p-8 bg-white">
                        <!-- Error Message -->
                        <% String error=(String) request.getAttribute("error"); %>
                            <% if (error !=null && !error.trim().isEmpty()) { %>
                                <div class="mb-6 bg-red-50 border-l-4 border-red-500 rounded-lg p-4">
                                    <div class="flex items-start">
                                        <svg class="h-6 w-6 text-red-500 mt-0.5" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                        <p class="ml-3 text-sm text-red-800 font-medium">
                                            <%= error %>
                                        </p>
                                    </div>
                                </div>
                                <% } %>

                                    <% String roomIdParam=request.getParameter("roomId"); if (roomIdParam==null) {
                                        roomIdParam=(String) request.getAttribute("roomId"); } Long roomId=null; Room
                                        room=null; if (roomIdParam !=null) { try { roomId=Long.parseLong(roomIdParam);
                                        room=new RoomDao().findById(roomId); } catch (Exception e) { /* Handle error */
                                        } } %>

                                        <!-- Room Info Card -->
                                        <% if (room !=null) { %>
                                            <div
                                                class="mb-8 bg-gradient-to-r from-blue-50 to-indigo-50 rounded-xl p-6 border border-blue-100">
                                                <h3 class="text-lg font-bold text-slate-900 mb-2">Selected Room</h3>
                                                <div class="flex items-center justify-between">
                                                    <div>
                                                        <p class="text-2xl font-bold text-slate-900">Room <%=
                                                                room.getRoomNumber() %>
                                                        </p>
                                                        <p class="text-sm text-slate-600 mt-1">
                                                            <%= room.getDescription() %>
                                                        </p>
                                                        <p class="text-sm text-slate-500 mt-2">
                                                            <span class="font-semibold">Capacity:</span>
                                                            <%= room.getCapacity() %> guests
                                                        </p>
                                                    </div>
                                                    <div class="text-right">
                                                        <p class="text-3xl font-bold text-primary-600">$<%=
                                                                room.getPricePerNight() %>
                                                        </p>
                                                        <p class="text-xs text-slate-500">per night</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>

                                                <!-- Booking Form -->
                                                <form action="book" method="post" class="space-y-6">
                                                    <input type="hidden" name="roomId" value="<%= roomId %>">

                                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                                        <div>
                                                            <label class="block text-sm font-bold text-slate-700 mb-2">
                                                                <svg class="w-4 h-4 inline mr-1" fill="none"
                                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                                        stroke-width="2"
                                                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                                                    </path>
                                                                </svg>
                                                                Check-in Date
                                                            </label>
                                                            <input type="date" name="startDate" required
                                                                min="<%= java.time.LocalDate.now() %>"
                                                                class="block w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent transition text-slate-900">
                                                        </div>
                                                        <div>
                                                            <label class="block text-sm font-bold text-slate-700 mb-2">
                                                                <svg class="w-4 h-4 inline mr-1" fill="none"
                                                                    stroke="currentColor" viewBox="0 0 24 24">
                                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                                        stroke-width="2"
                                                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                                                    </path>
                                                                </svg>
                                                                Check-out Date
                                                            </label>
                                                            <input type="date" name="endDate" required
                                                                min="<%= java.time.LocalDate.now().plusDays(1) %>"
                                                                class="block w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent transition text-slate-900">
                                                        </div>
                                                    </div>

                                                    <!-- Info Box -->
                                                    <div class="bg-amber-50 rounded-xl p-4 border border-amber-200">
                                                        <div class="flex items-start">
                                                            <svg class="h-5 w-5 text-amber-600 mt-0.5" fill="none"
                                                                stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2"
                                                                    d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                                                                </path>
                                                            </svg>
                                                            <div class="ml-3">
                                                                <h4 class="text-sm font-bold text-amber-900">Booking
                                                                    Policy</h4>
                                                                <ul class="text-xs text-amber-800 mt-1 space-y-1">
                                                                    <li>• Free cancellation up to 24 hours before
                                                                        check-in</li>
                                                                    <li>• Check-in time: 3:00 PM | Check-out time: 11:00
                                                                        AM</li>
                                                                    <li>• Multiple room bookings allowed per account
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Action Buttons -->
                                                    <div
                                                        class="flex items-center justify-end space-x-4 pt-6 border-t border-slate-200">
                                                        <a href="rooms"
                                                            class="px-6 py-3 text-slate-600 hover:text-slate-900 font-bold text-sm transition">
                                                            ← Back to Rooms
                                                        </a>
                                                        <button type="submit"
                                                            class="inline-flex items-center px-8 py-3 border border-transparent rounded-xl shadow-lg text-sm font-bold text-white bg-gradient-to-r from-primary-600 to-indigo-600 hover:from-primary-700 hover:to-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transform transition hover:-translate-y-0.5">
                                                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor"
                                                                viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2" d="M5 13l4 4L19 7"></path>
                                                            </svg>
                                                            Confirm Reservation
                                                        </button>
                                                    </div>
                                                </form>
                    </div>
                </div>
            </div>

            <jsp:include page="includes/footer.jsp" />