<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>首頁</title>

        <!-- Bootstrap 5 本地 CSS -->
        <link rel="stylesheet" href="/static/lib/css/bootstrap.min.css">

        <style>
            /* =============================================
           Swiss Style Design System — index.jsp
           規則：無陰影、無漸層、Mobile-First、
                 觸控面積 ≥ 44px、內文 ≥ 16px
        ============================================= */

            :root {
                --color-bg: #ffffff;
                --color-surface: #f5f5f5;
                --color-border: #1a1a1a;
                --color-text: #1a1a1a;
                --color-muted: #555555;
                --color-accent: #d62828;
                /* 瑞士紅 */
                --color-btn-bg: #1a1a1a;
                --color-btn-text: #ffffff;
                --color-btn-hover-bg: #d62828;
                --color-btn-hover-text: #ffffff;
                --font-sans: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                --border-width: 2px;
                --touch-min: 44px;
                /* 最小觸控面積 */
            }

            /* ---------- Reset & Base ---------- */
            *,
            *::before,
            *::after {
                box-sizing: border-box;
            }

            html {
                font-size: 16px;
                /* 基準字體，內文不低於 16px */
            }

            body {
                font-family: var(--font-sans);
                background-color: var(--color-bg);
                color: var(--color-text);
                margin: 0;
                -webkit-font-smoothing: antialiased;
            }

            /* ---------- Layout Wrapper ---------- */
            .page-wrapper {
                width: 100%;
                max-width: 860px;
                margin: 0 auto;
                padding: 0 1rem;
                /* 手機側邊距 px-3 等效 */
            }

            /* ---------- Header ---------- */
            .site-header {
                border-bottom: var(--border-width) solid var(--color-border);
                padding: 1.5rem 0 1rem;
            }

            .site-header h1 {
                font-size: clamp(1.4rem, 5vw, 2.25rem);
                /* 手機縮小，桌面放大 */
                font-weight: 900;
                letter-spacing: -0.02em;
                line-height: 1.15;
                margin: 0;
                color: var(--color-text);
            }

            /* ---------- Divider ---------- */
            .swiss-divider {
                border: none;
                border-top: var(--border-width) solid var(--color-border);
                margin: 0;
            }

            /* ---------- Navigation ---------- */
            .site-nav {
                padding: 1.25rem 0;
            }

            .site-nav .nav-group {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                /* Bootstrap gap — 防止誤觸 */
            }

            /* 觸控友善按鈕：最小面積 44×44px、無陰影、無漸層 */
            .swiss-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: var(--touch-min);
                min-width: var(--touch-min);
                padding: 0 1.25rem;
                font-family: var(--font-sans);
                font-size: 1rem;
                /* ≥ 16px */
                font-weight: 700;
                letter-spacing: 0.03em;
                text-transform: uppercase;
                color: var(--color-btn-text);
                background-color: var(--color-btn-bg);
                border: var(--border-width) solid var(--color-btn-bg);
                border-radius: 0;
                /* 瑞士風格：直角 */
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.15s ease, color 0.15s ease, border-color 0.15s ease;
                box-shadow: none !important;
                /* 嚴禁陰影 */
            }

            .swiss-btn:hover,
            .swiss-btn:focus-visible {
                background-color: var(--color-btn-hover-bg);
                border-color: var(--color-btn-hover-bg);
                color: var(--color-btn-hover-text);
                outline: none;
            }

            .swiss-btn:focus-visible {
                outline: 3px solid var(--color-accent);
                outline-offset: 2px;
            }

            /* ---------- Message Section ---------- */
            .message-block {
                padding: 0.875rem 1rem;
                border-left: 4px solid var(--color-accent);
                background-color: var(--color-surface);
                font-size: 1rem;
                /* ≥ 16px */
                color: var(--color-text);
                margin-bottom: 1rem;
            }

            /* ---------- Clock Section ---------- */
            .clock-section {
                padding: 1rem 0;
            }

            .clock-section p {
                font-size: 1rem;
                /* ≥ 16px */
                color: var(--color-muted);
                margin: 0;
                letter-spacing: 0.01em;
            }

            #clock {
                font-weight: 700;
                color: var(--color-text);
                font-variant-numeric: tabular-nums;
                /* 防止數字跳動造成 CLS */
            }

            /* ---------- Project Intro ---------- */
            .project-intro {
                border-top: var(--border-width) solid var(--color-border);
                padding: 1.25rem 0 0.5rem;
                margin-top: 0.25rem;
            }

            .project-intro__heading {
                font-size: 1rem;
                font-weight: 900;
                letter-spacing: 0.08em;
                text-transform: uppercase;
                color: var(--color-text);
                margin: 0 0 1rem;
                padding-bottom: 0.5rem;
                border-bottom: var(--border-width) solid var(--color-border);
            }

            .project-intro__body {
                display: flex;
                flex-direction: column;
                gap: 0.875rem;
            }

            .project-intro__para {
                font-size: 1rem;
                /* ≥ 16px */
                color: var(--color-text);
                line-height: 1.75;
                margin: 0;
            }

            .project-intro__para strong {
                font-weight: 700;
                color: var(--color-accent);
                /* 瑞士紅強調技術關鍵字 */
            }

            /* ---------- Footer ---------- */
            .site-footer {
                border-top: var(--border-width) solid var(--color-border);
                padding: 1rem 0;
                margin-top: 1.5rem;
            }

            .site-footer p {
                font-size: 0.875rem;
                color: var(--color-muted);
                margin: 0;
                letter-spacing: 0.02em;
            }

            /* ---------- Responsive: md+ 桌面端非對稱佈局 ---------- */
            @media (min-width: 768px) {
                .page-wrapper {
                    padding: 0 2rem;
                }

                .site-header {
                    padding: 2.5rem 0 1.25rem;
                }

                .site-nav .nav-group {
                    gap: 0.75rem;
                }

                /* 桌面端：主要操作與次要操作非對稱分區 */
                .site-nav .nav-group--primary {
                    flex: 0 0 auto;
                }

                .site-nav .nav-group--secondary {
                    flex: 1 1 auto;
                    justify-content: flex-end;
                }

                .site-footer p {
                    font-size: 1rem;
                }
            }
        </style>
    </head>

    <body>
        <!-- Vue 3 應用程式掛載點 -->
        <div id="app">
            <div class="page-wrapper">

                <!-- ===== Header ===== -->
                <header class="site-header">
                    <h1>會員註冊與資料管理系統</h1>
                </header>

                <hr class="swiss-divider">

                <!-- ===== Navigation ===== -->
                <nav class="site-nav" aria-label="主要導覽">

                    <!-- 手機：單欄垂直排列 flex-wrap；桌面：分兩群非對稱 -->
                    <div class="d-flex flex-wrap gap-2 gap-md-3">

                        <!-- 主要功能 -->
                        <button id="btn-register" type="button" class="swiss-btn" @click="navigate('register')">
                            註冊
                        </button>
                        <button id="btn-login" type="button" class="swiss-btn" @click="navigate('login')">
                            登入
                        </button>
                        <button id="btn-signout" type="button" class="swiss-btn" @click="navigate('signout')">
                            登出
                        </button>

                        <!-- 手機隱藏的分隔線；桌面顯示 -->
                        <span class="d-none d-md-inline-flex align-items-center px-1" aria-hidden="true"
                            style="border-left: 2px solid #1a1a1a; height: 44px;"></span>

                        <!-- 次要功能（非核心：手機顯示，桌面亦顯示） -->
                        <button id="btn-singlepage" type="button" class="swiss-btn" @click="navigate('singlepage')">
                            Single Page Application
                        </button>
                        <button id="btn-traditional" type="button" class="swiss-btn" title="Filter Test"
                            @click="navigate('products/product')">
                            Traditional JSP Page
                        </button>
                        <button id="btn-restful" type="button" class="swiss-btn"
                            @click="navigate('app/v1/customers/findall')">
                            RestfulApi
                        </button>
                    </div>
                </nav>

                <hr class="swiss-divider">

                <!-- ===== Session 訊息 ===== -->
                <% String message=(String) session.getAttribute("message"); if (message !=null) { %>
                    <div class="message-block" role="status" aria-live="polite">
                        <%= message %>
                    </div>
                    <% session.removeAttribute("message"); } %>

                        <!-- ===== 時鐘區塊 ===== -->
                        <section class="clock-section">
                            <p>目前時間：<span id="clock"></span></p>
                        </section>

                        <!-- ===== 專案簡介 ===== -->
                        <section class="project-intro" aria-labelledby="project-intro-heading">
                            <h2 class="project-intro__heading" id="project-intro-heading">專案簡介</h2>
                            <div class="project-intro__body">
                                <p class="project-intro__para">
                                    本案的核心價值在於打造一個高可用性與資安防禦兼備的會員管理架構。在開發初期，就決定採用
                                    <strong>Spring Boot</strong> 搭配 <strong>RESTful API</strong>
                                    的前後端分離架構，這不僅是為了目前的 Web 需求，更是為了未來系統擴充的靈活性。
                                </p>
                                <p class="project-intro__para">
                                    在效能處理上，特別關注系統的穩定度，因此導入效能較高的 <strong>HikariCP</strong>
                                    連線池，並配合 <strong>Spring JDBC Template</strong> 來操作資料庫；這樣做的目的是為了在保有
                                    SQL 撰寫靈活度的同時，能更精準地掌控存取效能，避免因 ORM 框架黑盒帶來的不可控損耗。
                                </p>
                                <p class="project-intro__para">
                                    針對資安這方面，實作了多層次的防護措施：除了前端的攔截校驗，後端更整合
                                    <strong>jbcrypt</strong> 進行雜湊加密，確保使用者密碼在資料庫中具有極高的不可逆性；同時利用
                                    <strong>Jasypt</strong> 對設定檔進行加密，落實運維端的資訊安全。為了確保資料傳輸的乾淨與安全，
                                    導入了 <strong>DTO 模式</strong>來封裝數據，精確控制資料曝露範圍，並透過
                                    <strong>Vue 3</strong> 與 <strong>Axios</strong>
                                    實現非同步操作，在大幅提升使用者操作流暢度的同時，也確保了後端 API 的高效與純粹。
                                </p>
                            </div>
                        </section>

                        <!-- ===== Footer ===== -->
                        <footer class="site-footer">
                            <p>&copy; 2026 Powered by Spring Boot</p>
                        </footer>

            </div><!-- /.page-wrapper -->
        </div><!-- /#app -->

        <!-- Bootstrap 5 本地 JS Bundle -->
        <script src="/static/lib/js/bootstrap.bundle.min.js"></script>

        <!-- Vue 3 本地 JS -->
        <script src="/static/lib/js/vue.global.prod.js"></script>

        <script>
            /* =============================================
               Vue 3 應用程式 — index.jsp
            ============================================= */
            const { createApp } = Vue;

            createApp({
                methods: {
                    navigate(path) {
                        window.location.href = path;
                    }
                }
            }).mount('#app');

            /* =============================================
               時鐘 — tabular-nums 防止 CLS 跳動
            ============================================= */
            (function initClock() {
                const clockEl = document.getElementById('clock');
                if (!clockEl) return;

                function updateClock() {
                    const now = new Date();
                    const pad = (n) => n.toString().padStart(2, '0');
                    const formattedTime =
                        now.getFullYear() + '/' +
                        pad(now.getMonth() + 1) + '/' +
                        pad(now.getDate()) + ' ' +
                        pad(now.getHours()) + ':' +
                        pad(now.getMinutes()) + ':' +
                        pad(now.getSeconds());
                    clockEl.textContent = formattedTime;
                }

                updateClock();                          // 立即渲染，減少 CLS
                setInterval(updateClock, 1000);
            })();
        </script>
    </body>

    </html>