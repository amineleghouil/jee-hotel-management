<jsp:include page="includes/header.jsp">
    <jsp:param name="title" value="Create Account - LuxeStay" />
</jsp:include>

<div class="flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full">
        <!-- Card -->
        <div class="bg-white/95 backdrop-blur-sm p-10 rounded-2xl shadow-2xl border border-white/20">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold text-slate-900 tracking-tight">Create Account</h2>
                <p class="text-slate-600 mt-2">Start your luxury experience today</p>
            </div>

            <!-- Error Message -->
            <% String error=(String) request.getAttribute("error"); %>
                <% if (error !=null && !error.trim().isEmpty()) { %>
                    <div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4">
                        <div class="flex items-start">
                            <svg class="h-5 w-5 text-red-500 mt-0.5" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <p class="ml-3 text-sm text-red-800">
                                <%= error %>
                            </p>
                        </div>
                    </div>
                    <% } %>

                        <!-- Form -->
                        <form action="auth" method="post" class="space-y-6">
                            <input type="hidden" name="action" value="register">

                            <div>
                                <label for="username"
                                    class="block text-sm font-semibold text-slate-700 mb-2">Username</label>
                                <input type="text" name="username" id="username" required autocomplete="username"
                                    class="block w-full px-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition duration-200 text-slate-900 placeholder-slate-400"
                                    placeholder="Choose a username">
                            </div>

                            <div>
                                <label for="email" class="block text-sm font-semibold text-slate-700 mb-2">Email
                                    Address</label>
                                <input type="email" name="email" id="email" required autocomplete="email"
                                    class="block w-full px-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition duration-200 text-slate-900 placeholder-slate-400"
                                    placeholder="Enter your email">
                            </div>

                            <div>
                                <label for="phoneNumber" class="block text-sm font-semibold text-slate-700 mb-2">Phone
                                    Number</label>
                                <input type="tel" name="phoneNumber" id="phoneNumber" required autocomplete="tel"
                                    class="block w-full px-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition duration-200 text-slate-900 placeholder-slate-400"
                                    placeholder="Enter your phone number">
                            </div>

                            <div>
                                <label for="password"
                                    class="block text-sm font-semibold text-slate-700 mb-2">Password</label>
                                <input type="password" name="password" id="password" required
                                    autocomplete="new-password"
                                    class="block w-full px-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition duration-200 text-slate-900 placeholder-slate-400"
                                    placeholder="Create a secure password">
                            </div>

                            <div>
                                <label for="confirmPassword"
                                    class="block text-sm font-semibold text-slate-700 mb-2">Confirm Password</label>
                                <input type="password" name="confirmPassword" id="confirmPassword" required
                                    autocomplete="new-password"
                                    class="block w-full px-4 py-3.5 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition duration-200 text-slate-900 placeholder-slate-400"
                                    placeholder="Confirm your password">
                            </div>

                            <div class="flex items-start">
                                <div class="flex items-center h-5">
                                    <input id="terms" name="terms" type="checkbox" required
                                        class="h-4 w-4 text-primary-600 focus:ring-primary-500 border-slate-300 rounded">
                                </div>
                                <div class="ml-3 text-sm">
                                    <label for="terms" class="text-slate-700">
                                        I agree to the <a href="#"
                                            class="font-medium text-primary-600 hover:text-primary-500">Terms and
                                            Conditions</a> and <a href="#"
                                            class="font-medium text-primary-600 hover:text-primary-500">Privacy
                                            Policy</a>
                                    </label>
                                </div>
                            </div>

                            <div>
                                <button type="submit"
                                    class="w-full flex justify-center items-center py-3.5 px-4 border border-transparent rounded-xl text-sm font-bold text-white bg-gradient-to-r from-slate-900 to-slate-800 hover:from-slate-800 hover:to-slate-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-900 shadow-lg transition duration-200 transform hover:scale-[1.02]">
                                    Create Account
                                    <svg class="ml-2 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                                    </svg>
                                </button>
                            </div>
                        </form>

                        <!-- Footer -->
                        <div class="mt-8 pt-6 border-t border-slate-100 text-center">
                            <p class="text-sm text-slate-600">
                                Already have an account?
                                <a href="login.jsp"
                                    class="font-semibold text-primary-600 hover:text-primary-500 transition">Sign in</a>
                            </p>
                        </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />