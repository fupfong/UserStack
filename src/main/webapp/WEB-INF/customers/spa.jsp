<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>客戶管理 SPA</title>
        <link rel="stylesheet" href="/static/lib/css/bootstrap.min.css">
        <style>
            /* =============================================
           Swiss Style Design System — spa.jsp
           嚴禁 box-shadow / gradient；觸控面積 ≥ 44px；內文 ≥ 16px
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
                --color-btn-hover-text: #ffffff;
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

            /* ---------- Page Wrapper ---------- */
            .page-wrapper {
                width: 100%;
                max-width: 1060px;
                margin: 0 auto;
                padding: 1.5rem 1rem;
            }

            /* ---------- Header ---------- */
            .site-header {
                border-bottom: var(--border-width) solid var(--color-border);
                padding-bottom: 1rem;
                margin-bottom: 1.25rem;
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

            /* ---------- Toolbar ---------- */
            .toolbar {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: space-between;
                gap: 0.75rem;
                margin-bottom: 1rem;
            }

            .search-group {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                align-items: center;
            }

            /* ---------- Form Controls ---------- */
            .swiss-input {
                height: var(--touch-min);
                padding: 0 0.75rem;
                font-family: var(--font-sans);
                font-size: 1rem;
                color: var(--color-text);
                background-color: var(--color-bg);
                border: var(--border-width) solid var(--color-border);
                border-radius: 0;
                outline: none;
                transition: border-color 0.15s ease;
                box-shadow: none !important;
                width: 200px;
            }

            .swiss-input:focus {
                border-color: var(--color-accent);
            }

            /* ---------- Buttons ---------- */
            .swiss-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: var(--touch-min);
                min-width: var(--touch-min);
                padding: 0 1rem;
                font-family: var(--font-sans);
                font-size: 1rem;
                font-weight: 700;
                letter-spacing: 0.03em;
                text-transform: uppercase;
                color: var(--color-btn-text);
                background-color: var(--color-btn-bg);
                border: var(--border-width) solid var(--color-btn-bg);
                border-radius: 0;
                cursor: pointer;
                transition: background-color 0.15s ease, border-color 0.15s ease, color 0.15s ease;
                box-shadow: none !important;
            }

            .swiss-btn:hover {
                background-color: var(--color-btn-hover-bg);
                border-color: var(--color-btn-hover-bg);
            }

            .swiss-btn--outline {
                background-color: transparent;
                color: var(--color-btn-bg);
            }

            .swiss-btn--outline:hover {
                background-color: var(--color-btn-bg);
                color: var(--color-btn-text);
            }

            .swiss-btn--danger {
                background-color: var(--color-accent);
                border-color: var(--color-accent);
            }

            .swiss-btn--danger:hover {
                background-color: #a01e1e;
                border-color: #a01e1e;
            }

            .swiss-btn:disabled {
                opacity: 0.35;
                cursor: not-allowed;
                pointer-events: none;
            }

            /* ---------- Table ---------- */
            .table-scroll {
                width: 100%;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }

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

            .swiss-table td.td-center {
                text-align: center;
            }

            /* ---------- Pagination ---------- */
            .pagination-bar {
                display: none;
                flex-wrap: wrap;
                align-items: center;
                justify-content: center;
                gap: 0.75rem;
                margin-top: 1rem;
            }

            .pagination-bar.visible {
                display: flex;
            }

            .page-info {
                font-size: 1rem;
                font-weight: 700;
                color: var(--color-text);
                font-variant-numeric: tabular-nums;
            }

            /* ---------- Modal Overlay ---------- */
            .swiss-modal {
                display: none;
                position: fixed;
                z-index: 200;
                inset: 0;
                background-color: rgba(0, 0, 0, 0.55);
                align-items: center;
                justify-content: center;
            }

            .swiss-modal.open {
                display: flex;
            }

            .swiss-modal__content {
                background-color: var(--color-bg);
                border: var(--border-width) solid var(--color-border);
                width: min(380px, 92vw);
                padding: 1.5rem;
            }

            .swiss-modal__title {
                font-size: 1rem;
                font-weight: 900;
                letter-spacing: 0.04em;
                text-transform: uppercase;
                border-bottom: var(--border-width) solid var(--color-border);
                padding-bottom: 0.625rem;
                margin: 0 0 1.25rem;
            }

            /* ---------- Modal Form ---------- */
            .modal-form-label {
                display: block;
                font-size: 1rem;
                font-weight: 700;
                letter-spacing: 0.03em;
                text-transform: uppercase;
                margin-bottom: 0.25rem;
            }

            .modal-form-control {
                display: block;
                width: 100%;
                min-height: var(--touch-min);
                padding: 0.5rem 0.75rem;
                font-family: var(--font-sans);
                font-size: 1rem;
                color: var(--color-text);
                background-color: var(--color-bg);
                border: var(--border-width) solid var(--color-border);
                border-radius: 0;
                outline: none;
                transition: border-color 0.15s ease;
                box-shadow: none !important;
            }

            .modal-form-control:focus {
                border-color: var(--color-accent);
            }

            .modal-form-control.readonly {
                background-color: var(--color-surface);
                border-color: #aaa;
                cursor: not-allowed;
                color: var(--color-muted);
            }

            /* ---------- Clock & Footer ---------- */
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

            /* ---------- Responsive ---------- */
            @media (min-width: 768px) {
                .page-wrapper {
                    padding: 2.5rem 2rem;
                }

                .swiss-input {
                    width: 240px;
                }
            }
        </style>
    </head>

    <body>
        <!-- ==================== Edit Modal ==================== -->
        <div id="editModal" class="swiss-modal" role="dialog" aria-modal="true" aria-labelledby="editModalTitle">
            <div class="swiss-modal__content">
                <h3 class="swiss-modal__title" id="editModalTitle">修改客戶詳細資訊</h3>
                <form id="editForm">
                    <input type="hidden" id="editMemberID">

                    <div class="mb-3">
                        <label for="editMemberIDShow" class="modal-form-label">編號(唯讀)</label>
                        <input type="text" id="editMemberIDShow" class="modal-form-control readonly" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editAccount" class="modal-form-label">帳號</label>
                        <input type="text" id="editAccount" class="modal-form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="editUsername" class="modal-form-label">稱謂</label>
                        <input type="text" id="editUsername" class="modal-form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEmail" class="modal-form-label">郵件</label>
                        <input type="email" id="editEmail" class="modal-form-control" required>
                    </div>

                    <div class="d-flex flex-column gap-2 mt-3">
                        <button type="button" id="btn-save" class="swiss-btn" onclick="saveCustomer()">儲存</button>
                        <button type="button" id="btn-cancel" class="swiss-btn swiss-btn--outline"
                            onclick="closeModal()">取消</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ==================== Message Modal ==================== -->
        <div id="messageModal" class="swiss-modal" role="dialog" aria-modal="true" aria-labelledby="messageTitle">
            <div class="swiss-modal__content" style="text-align:center;">
                <h3 class="swiss-modal__title" id="messageTitle" style="justify-content:center;">提示</h3>
                <p id="messageText" style="font-size:1rem; color:var(--color-text); margin-bottom:1.25rem;"></p>
                <button type="button" id="btn-message-ok" class="swiss-btn" onclick="closeMessageModal()"
                    style="width:100%; max-width:160px;">確認</button>
            </div>
        </div>

        <!-- ==================== Page ==================== -->
        <div class="page-wrapper">

            <header class="site-header">
                <h1>客戶資料管理系統 (SPA)</h1>
            </header>

            <!-- Toolbar -->
            <div class="toolbar">
                <button type="button" id="btn-home" class="swiss-btn swiss-btn--outline"
                    onclick="location.href='${pageContext.request.contextPath}/index'">
                    首頁
                </button>

                <div class="search-group">
                    <input type="text" id="searchID" class="swiss-input" placeholder="輸入會員ID">
                    <button type="button" id="btn-search" class="swiss-btn" onclick="searchCustomer()">
                        搜尋
                    </button>
                </div>
            </div>

            <!-- Table -->
            <div class="table-scroll">
                <table class="swiss-table" id="customerTable">
                    <thead>
                        <tr>
                            <th>編號</th>
                            <th>帳號</th>
                            <th>稱謂</th>
                            <th>郵件</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div id="pagination" class="pagination-bar">
                <button type="button" id="btnPrev" class="swiss-btn" onclick="changePage(-1)">上一頁</button>
                <span id="pageInfo" class="page-info">目前第 1 頁</span>
                <button type="button" id="btnNext" class="swiss-btn" onclick="changePage(1)">下一頁</button>
            </div>

            <hr class="swiss-divider">

            <section class="clock-section mb-2">
                <p>目前時間：<span id="clock"></span></p>
            </section>

            <footer class="site-footer">
                <p>&copy; 2026 Powered by Spring Boot</p>
            </footer>
        </div>

        <!-- Scripts -->
        <script src="/static/lib/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
            /* =============================================
               SPA 邏輯 — 與原版完全相同，僅 DOM class 更新
            ============================================= */
            const API_BASE = '${pageContext.request.contextPath}/app/v1/customers';
            let isFirstLoad = true;
            let allCustomers = [];
            let currentPage = 1;
            const pageSize = 10;

            document.addEventListener('DOMContentLoaded', fetchCustomers);

            function fetchCustomers() {
                const tbody = document.querySelector('#customerTable tbody');
                tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;padding:1.5rem;">載入中...</td></tr>';

                axios.get(API_BASE + '/findall')
                    .then(response => {
                        allCustomers = response.data;
                        currentPage = 1;
                        renderTable();
                        if (isFirstLoad) {
                            showMessage('完成', '客戶資料下載完成');
                            isFirstLoad = false;
                        }
                    })
                    .catch(error => {
                        console.error('API Error (FetchAll):', error);
                        const errMsg = error.response ? ('狀態碼: ' + error.response.status) : error.message;
                        tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;color:var(--color-accent);">獲取資料失敗 (' + errMsg + ')</td></tr>';
                    });
            }

            function searchCustomer() {
                const id = document.getElementById('searchID').value.trim();
                if (!id) { fetchCustomers(); return; }

                const tbody = document.querySelector('#customerTable tbody');
                tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;padding:1.5rem;">搜尋中...</td></tr>';

                axios.get(API_BASE + '/findbyid/' + id)
                    .then(response => {
                        const c = response.data;
                        if (!c || !c.memberID) {
                            tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;">查無此客戶資料 (ID: ' + id + ')</td></tr>';
                            document.getElementById('pagination').classList.remove('visible');
                            return;
                        }
                        renderTable([c], true);
                    })
                    .catch(error => {
                        console.error('Search Error:', error);
                        const errMsg = error.response ? ('狀態碼: ' + error.response.status) : error.message;
                        tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;color:var(--color-accent);">搜尋失敗 (' + errMsg + ')</td></tr>';
                    });
            }

            function renderTable(dataOverride, isSearchSingle = false) {
                const data = dataOverride || allCustomers;
                const tbody = document.querySelector('#customerTable tbody');
                tbody.innerHTML = '';

                if (data.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;padding:1.5rem;">目前無客戶資料</td></tr>';
                    document.getElementById('pagination').classList.remove('visible');
                    return;
                }

                let displayData = data;
                if (!isSearchSingle) {
                    const start = (currentPage - 1) * pageSize;
                    const end = start + pageSize;
                    displayData = data.slice(start, end);
                    const totalPages = Math.ceil(data.length / pageSize);
                    const pg = document.getElementById('pagination');
                    totalPages > 1 ? pg.classList.add('visible') : pg.classList.remove('visible');
                    document.getElementById('pageInfo').innerText = '目前第 ' + currentPage + ' / ' + totalPages + ' 頁 (共 ' + data.length + ' 筆)';
                    document.getElementById('btnPrev').disabled = (currentPage === 1);
                    document.getElementById('btnNext').disabled = (currentPage === totalPages);
                } else {
                    document.getElementById('pagination').classList.remove('visible');
                }

                displayData.forEach(c => {
                    const tr = document.createElement('tr');
                    tr.innerHTML =
                        '<td>' + c.memberID + '</td>' +
                        '<td>' + c.account + '</td>' +
                        '<td>' + c.username + '</td>' +
                        '<td>' + c.email + '</td>' +
                        '<td class="td-center">' +
                        '<button class="swiss-btn" style="margin-right:4px;font-size:0.875rem;" ' +
                        'onclick="openEditModal(\'' + c.memberID + '\', \'' + c.account + '\', \'' + c.username + '\', \'' + c.email + '\')">修改</button>' +
                        '<button class="swiss-btn swiss-btn--danger" style="font-size:0.875rem;" ' +
                        'onclick="deleteCustomer(\'' + c.memberID + '\')">刪除</button>' +
                        '</td>';
                    tbody.appendChild(tr);
                });
            }

            function changePage(offset) {
                const totalPages = Math.ceil(allCustomers.length / pageSize);
                const newPage = currentPage + offset;
                if (newPage >= 1 && newPage <= totalPages) {
                    currentPage = newPage;
                    renderTable();
                }
            }

            function openEditModal(id, account, username, email) {
                document.getElementById('editMemberID').value = id;
                document.getElementById('editMemberIDShow').value = id;
                document.getElementById('editAccount').value = account;
                document.getElementById('editUsername').value = username;
                document.getElementById('editEmail').value = email;
                document.getElementById('editModal').classList.add('open');
            }

            function closeModal() {
                document.getElementById('editModal').classList.remove('open');
            }

            function showMessage(title, text) {
                document.getElementById('messageTitle').innerText = title;
                document.getElementById('messageText').innerText = text;
                document.getElementById('messageModal').classList.add('open');
            }

            function closeMessageModal() {
                document.getElementById('messageModal').classList.remove('open');
            }

            window.addEventListener('click', function (event) {
                const editModal = document.getElementById('editModal');
                const messageModal = document.getElementById('messageModal');
                if (event.target === editModal) closeModal();
                if (event.target === messageModal) closeMessageModal();
            });

            function saveCustomer() {
                const id = document.getElementById('editMemberID').value;
                const payload = {
                    memberID: id,
                    account: document.getElementById('editAccount').value,
                    username: document.getElementById('editUsername').value,
                    email: document.getElementById('editEmail').value
                };

                axios.put(API_BASE + '/update/' + id, payload)
                    .then(() => {
                        alert('✅ 更新成功！');
                        closeModal();
                        fetchCustomers();
                    })
                    .catch(error => {
                        console.error('Update Error:', error);
                        const errMsg = error.response ? error.response.data : error.message;
                        alert('❌ 更新失敗：' + errMsg);
                    });
            }

            function deleteCustomer(id) {
                if (confirm(`⚠️ 確定要刪除會員編號 [ ${id} ] 嗎？`)) {
                    axios.delete(API_BASE + '/delete/' + id)
                        .then(() => {
                            alert('🗑️ 刪除成功！');
                            fetchCustomers();
                        })
                        .catch(error => {
                            console.error('Delete Error:', error);
                            alert('❌ 刪除失敗');
                        });
                }
            }

            /* ---------- Clock ---------- */
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