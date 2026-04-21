<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.pfong.userstack.entity.Product" %>
            <!DOCTYPE html>
            <html lang="zh-TW">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>商品資料清單 - 傳統渲染模式</title>
                <link rel="stylesheet" href="/static/lib/css/bootstrap.min.css">
                <style>
                    /* =============================================
           Swiss Style Design System — product.jsp
        ============================================= */
                    :root {
                        --color-bg: #ffffff;
                        --color-surface: #f5f5f5;
                        --color-border: #1a1a1a;
                        --color-text: #1a1a1a;
                        --color-muted: #555555;
                        --color-accent: #d62828;
                        --color-btn-bg: #1a1a1a;
                        --color-btn-text: #ffffff;
                        --color-btn-hover-bg: #d62828;
                        --font-sans: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                        --border-width: 2px;
                        --touch-min: 44px;
                    }

                    *,
                    *::before,
                    *::after {
                        box-sizing: border-box;
                    }

                    html {
                        font-size: 16px;
                    }

                    body {
                        font-family: var(--font-sans);
                        background-color: var(--color-bg);
                        color: var(--color-text);
                        margin: 0;
                        -webkit-font-smoothing: antialiased;
                    }

                    .page-wrapper {
                        width: 100%;
                        max-width: 900px;
                        margin: 0 auto;
                        padding: 1.5rem 1rem;
                    }

                    .site-header {
                        border-bottom: var(--border-width) solid var(--color-border);
                        padding-bottom: 1rem;
                        margin-bottom: 1.5rem;
                    }

                    .site-header h1 {
                        font-size: clamp(1.3rem, 5vw, 2rem);
                        font-weight: 900;
                        letter-spacing: -0.02em;
                        margin: 0;
                    }

                    .swiss-divider {
                        border: none;
                        border-top: var(--border-width) solid var(--color-border);
                        margin: 1.25rem 0;
                    }

                    /* Table */
                    .swiss-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 1rem;
                    }

                    .swiss-table th,
                    .swiss-table td {
                        padding: 0.75rem 1rem;
                        border: var(--border-width) solid var(--color-border);
                        text-align: left;
                        font-size: 1rem;
                    }

                    .swiss-table thead th {
                        background-color: var(--color-border);
                        color: var(--color-btn-text);
                        font-weight: 700;
                        letter-spacing: 0.04em;
                        text-transform: uppercase;
                        text-align: center;
                    }

                    .swiss-table tbody tr:nth-child(even) {
                        background-color: var(--color-surface);
                    }

                    .swiss-table td:first-child {
                        text-align: center;
                        font-weight: 700;
                        color: var(--color-muted);
                    }

                    /* Table scroll on mobile */
                    .table-scroll {
                        width: 100%;
                        overflow-x: auto;
                        -webkit-overflow-scrolling: touch;
                    }

                    /* Empty/No data */
                    .swiss-table .no-data {
                        text-align: center;
                        color: var(--color-muted);
                        padding: 1.5rem;
                    }

                    /* Pagination */
                    .pagination-bar {
                        display: flex;
                        flex-wrap: wrap;
                        align-items: center;
                        justify-content: center;
                        gap: 0.75rem;
                        margin-top: 1.25rem;
                    }

                    .page-info {
                        font-size: 1rem;
                        font-weight: 700;
                        color: var(--color-text);
                    }

                    .page-sub {
                        font-size: 0.875rem;
                        font-weight: 400;
                        color: var(--color-muted);
                        margin-left: 0.375rem;
                    }

                    .swiss-btn {
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        min-height: var(--touch-min);
                        min-width: var(--touch-min);
                        padding: 0 1.25rem;
                        font-family: var(--font-sans);
                        font-size: 1rem;
                        font-weight: 700;
                        letter-spacing: 0.04em;
                        text-transform: uppercase;
                        color: var(--color-btn-text);
                        background-color: var(--color-btn-bg);
                        border: var(--border-width) solid var(--color-btn-bg);
                        border-radius: 0;
                        cursor: pointer;
                        transition: background-color 0.15s ease, border-color 0.15s ease;
                        box-shadow: none !important;
                    }

                    .swiss-btn:hover {
                        background-color: var(--color-btn-hover-bg);
                        border-color: var(--color-btn-hover-bg);
                    }

                    .swiss-btn:disabled {
                        opacity: 0.3;
                        cursor: not-allowed;
                        pointer-events: none;
                    }

                    .swiss-btn--outline {
                        background-color: transparent;
                        color: var(--color-btn-bg);
                    }

                    .swiss-btn--outline:hover {
                        background-color: var(--color-btn-bg);
                        color: var(--color-btn-text);
                    }

                    .clock-section p {
                        font-size: 1rem;
                        color: var(--color-muted);
                        margin: 0;
                    }

                    #clock {
                        font-weight: 700;
                        color: var(--color-text);
                        font-variant-numeric: tabular-nums;
                    }

                    .site-footer {
                        border-top: var(--border-width) solid var(--color-border);
                        padding: 1rem 0;
                        margin-top: 1.5rem;
                    }

                    .site-footer p {
                        font-size: 0.875rem;
                        color: var(--color-muted);
                        margin: 0;
                    }

                    @media (min-width: 768px) {
                        .page-wrapper {
                            padding: 2.5rem 2rem;
                        }
                    }
                </style>
            </head>

            <body>
                <% List<Product> productAll = (List<Product>) request.getAttribute("productAll");
                        int pageSize = 10;
                        int currentPage = 1;
                        String pageParam = request.getParameter("page");
                        if (pageParam != null && !pageParam.isEmpty()) {
                        try { currentPage = Integer.parseInt(pageParam); }
                        catch (NumberFormatException e) { currentPage = 1; }
                        }
                        int totalRecords = (productAll != null) ? productAll.size() : 0;
                        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
                        if (totalPages == 0) totalPages = 1;
                        if (currentPage < 1) currentPage=1; if (currentPage> totalPages) currentPage = totalPages;
                            int startIndex = (currentPage - 1) * pageSize;
                            int endIndex = Math.min(startIndex + pageSize, totalRecords);
                            List<Product> pagedList;
                                if (productAll != null && !productAll.isEmpty() && startIndex < totalRecords) {
                                    pagedList=productAll.subList(startIndex, endIndex); } else { pagedList=new
                                    java.util.ArrayList<>();
                                    }
                                    %>

                                    <div class="page-wrapper">

                                        <header class="site-header">
                                            <h1>商品資料查詢系統</h1>
                                        </header>

                                        <main>
                                            <div class="table-scroll">
                                                <table class="swiss-table" id="productTable">
                                                    <thead>
                                                        <tr>
                                                            <th>編號</th>
                                                            <th>名稱</th>
                                                            <th>類別</th>
                                                            <th>產地</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% if (!pagedList.isEmpty()) { for (Product product : pagedList)
                                                            { %>
                                                            <tr>
                                                                <td>
                                                                    <%= product.getProductId() %>
                                                                </td>
                                                                <td>
                                                                    <%= product.getProductName() %>
                                                                </td>
                                                                <td>
                                                                    <%= product.getType() %>
                                                                </td>
                                                                <td>
                                                                    <%= product.getRegion() %>
                                                                </td>
                                                            </tr>
                                                            <% } } else { %>
                                                                <tr>
                                                                    <td colspan="4" class="no-data">暫無商品資料</td>
                                                                </tr>
                                                                <% } %>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <!-- 分頁列 -->
                                            <div class="pagination-bar">
                                                <button type="button" id="btn-prev-page" class="swiss-btn"
                                                    onclick="window.location.href='?page=<%= currentPage - 1 %>'"
                                                    <%=(currentPage <=1) ? "disabled" : "" %>>
                                                    上一頁
                                                </button>

                                                <span class="page-info">
                                                    第 <%= currentPage %> / <%= totalPages %> 頁
                                                            <span class="page-sub">
                                                                (顯示第 <%= startIndex + (totalRecords> 0 ? 1 : 0) %> 至 <%=
                                                                        endIndex %> 筆，共 <%= totalRecords %> 筆)
                                                            </span>
                                                </span>

                                                <button type="button" id="btn-next-page" class="swiss-btn"
                                                    onclick="window.location.href='?page=<%= currentPage + 1 %>'"
                                                    <%=(currentPage>= totalPages) ? "disabled" : "" %>>
                                                    下一頁
                                                </button>
                                            </div>
                                        </main>

                                        <hr class="swiss-divider">

                                        <div class="mb-3">
                                            <button type="button" id="btn-product-home" class="swiss-btn"
                                                onclick="window.location.href='/index'">
                                                首頁
                                            </button>
                                        </div>

                                        <section class="clock-section mb-2">
                                            <p>目前時間：<span id="clock"></span></p>
                                        </section>

                                        <footer class="site-footer">
                                            <p>&copy; 2026 Powered by Spring Boot</p>
                                        </footer>
                                    </div>

                                    <script src="/static/lib/js/bootstrap.bundle.min.js"></script>
                                    <script>
                                        (function initClock() {
                                            const clockEl = document.getElementById('clock');
                                            if (!clockEl) return;
                                            function updateClock() {
                                                const now = new Date();
                                                const pad = (n) => n.toString().padStart(2, '0');
                                                clockEl.textContent = now.getFullYear() + '/' +
                                                    pad(now.getMonth() + 1) + '/' +
                                                    pad(now.getDate()) + ' ' +
                                                    pad(now.getHours()) + ':' +
                                                    pad(now.getMinutes()) + ':' +
                                                    pad(now.getSeconds());
                                            }
                                            updateClock();
                                            setInterval(updateClock, 1000);
                                        })();
                                    </script>
            </body>

            </html>