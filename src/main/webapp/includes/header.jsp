<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.hotel.model.User" %>
        <%@ taglib uri="jakarta.tags.core" prefix="c" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${param.title != null ? param.title : 'Hotel Luxe'}</title>

                <!-- Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">

                <!-- Tailwind CSS -->
                <script src="https://cdn.tailwindcss.com"></script>
                <script>
                    tailwind.config = {
                        theme: {
                            extend: {
                                fontFamily: {
                                    sans: ['"Plus Jakarta Sans"', 'sans-serif'],
                                },
                                colors: {
                                    primary: {
                                        50: '#f0f9ff',
                                        100: '#e0f2fe',
                                        500: '#0ea5e9',
                                        600: '#0284c7',
                                        700: '#0369a1',
                                        900: '#0c4a6e',
                                    },
                                    secondary: '#64748b',
                                }
                            }
                        }
                    }
                </script>
                <style>
                    .glass {
                        background: rgba(255, 255, 255, 0.95);
                        backdrop-filter: blur(10px);
                        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                    }

                    body {
                        background-image: url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=3000&q=80');
                        background-size: cover;
                        background-position: center;
                        background-attachment: fixed;
                    }

                    .page-overlay {
                        background: rgba(15, 23, 42, 0.92);
                        min-height: 100vh;
                    }
                </style>
            </head>

            <body class="font-sans antialiased text-slate-800">
                <div class="page-overlay flex flex-col min-h-screen">

                    <!-- Navigation -->
                    <nav class="sticky top-0 z-50 glass shadow-md border-b border-white/10">
                        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                            <div class="flex justify-between h-20">

                                <!-- Logo Section -->
                                <div class="flex items-center">
                                    <a href="${pageContext.request.contextPath}/"
                                        class="flex items-center space-x-3 group">
                                        <div
                                            class="p-2 bg-primary-600 rounded-lg shadow-lg group-hover:bg-primary-500 transition duration-300">
                                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                                                </path>
                                            </svg>
                                        </div>
                                        <span
                                            class="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-slate-800 to-slate-600 tracking-tight">
                                            LuxeStay
                                        </span>
                                    </a>

                                    <!-- Desktop Nav Links -->
                                    <div class="hidden md:ml-12 md:flex md:space-x-8">
                                        <a href="${pageContext.request.contextPath}/"
                                            class="text-white bg-slate-800/10 hover:bg-slate-800/20 px-3 py-2 rounded-md text-sm font-semibold transition bg-opacity-0 hover:bg-opacity-10 text-slate-700 hover:text-primary-700">
                                            Home
                                        </a>
                                    </div>
                                </div>

                                <!-- Auth Section -->
                                <div class="flex items-center space-x-4">
                                    <% User currentUser=(User) session.getAttribute("user"); if (currentUser !=null) {
                                        %>
                                        <div class="hidden md:flex items-center space-x-6 mr-2">
                                            <a href="${pageContext.request.contextPath}/my-reservations"
                                                class="text-sm font-semibold text-slate-600 hover:text-primary-600 transition flex items-center">
                                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor"
                                                    viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                </svg>
                                                My Bookings
                                            </a>
                                        </div>

                                        <!-- User Menu -->
                                        <div class="flex items-center pl-6 border-l border-slate-200 space-x-3">
                                            <div class="text-right hidden md:block">
                                                <p class="text-sm font-bold text-slate-800">
                                                    <%= currentUser.getUsername() %>
                                                </p>
                                                <p class="text-xs text-slate-500 uppercase tracking-wide">
                                                    <%= currentUser.getRole() %>
                                                </p>
                                            </div>
                                            <div
                                                class="h-10 w-10 bg-gradient-to-br from-primary-500 to-indigo-600 rounded-full flex items-center justify-center text-white font-bold shadow-md">
                                                <%= currentUser.getUsername().substring(0,1).toUpperCase() %>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/auth?logout=true"
                                                class="text-slate-400 hover:text-red-500 transition p-2" title="Logout">
                                                <svg class="w-5 h-5" fill="none" stroke="currentColor"
                                                    viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1">
                                                    </path>
                                                </svg>
                                            </a>
                                        </div>
                                        <% } else { %>
                                            <a href="${pageContext.request.contextPath}/login.jsp"
                                                class="text-slate-600 hover:text-slate-900 font-semibold text-sm px-4 py-2 transition">
                                                Log In
                                            </a>
                                            <a href="${pageContext.request.contextPath}/register.jsp"
                                                class="inline-flex items-center justify-center px-6 py-2.5 border border-transparent text-sm font-bold rounded-full text-white bg-slate-900 hover:bg-slate-800 shadow-xl shadow-slate-900/10 transition duration-200 ease-in-out transform hover:-translate-y-0.5">
                                                Join Now
                                            </a>
                                            <% } %>
                                </div>
                            </div>
                        </div>
                    </nav>

                    <!-- Main Content -->
                    <main class="flex-grow">