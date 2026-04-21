<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>登入</title>
        <link rel="stylesheet" href="/static/lib/css/bootstrap.min.css">
        <style>
            /* =============================================
           Swiss Style Design System — login.jsp
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
                max-width: 560px;
                margin: 0 auto;
                padding: 1.5rem 1rem;
            }

            /* Header */
            .site-header {
                border-bottom: var(--border-width) solid var(--color-border);
                padding-bottom: 1rem;
                margin-bottom: 1.5rem;
            }

            .site-header h1 {
                font-size: clamp(1.3rem, 5vw, 1.75rem);
                font-weight: 900;
                letter-spacing: -0.02em;
                margin: 0;
            }

            .swiss-divider {
                border: none;
                border-top: var(--border-width) solid var(--color-border);
                margin: 1.25rem 0;
            }

            /* Form */
            .swiss-form-label {
                display: block;
                font-size: 1rem;
                font-weight: 700;
                letter-spacing: 0.04em;
                text-transform: uppercase;
                margin-bottom: 0.375rem;
                color: var(--color-text);
            }

            .swiss-form-control {
                display: block;
                width: 100%;
                min-height: var(--touch-min);
                padding: 0.625rem 0.75rem;
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

            .swiss-form-control:focus {
                border-color: var(--color-accent);
            }

            /* Buttons */
            .swiss-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: var(--touch-min);
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

            .swiss-btn:hover,
            .swiss-btn:focus-visible {
                background-color: var(--color-btn-hover-bg);
                border-color: var(--color-btn-hover-bg);
                outline: none;
            }

            .swiss-btn--outline {
                background-color: transparent;
                color: var(--color-btn-bg);
            }

            .swiss-btn--outline:hover {
                background-color: var(--color-btn-bg);
                color: var(--color-btn-text);
            }

            /* Info block */
            .info-block {
                background-color: var(--color-surface);
                border-left: 4px solid var(--color-border);
                padding: 1rem;
                margin-top: 1.25rem;
            }

            .info-block h3 {
                font-size: 1rem;
                font-weight: 700;
                margin: 0 0 0.5rem;
                letter-spacing: 0.02em;
            }

            .info-block p {
                font-size: 1rem;
                color: var(--color-muted);
                margin: 0 0 0.25rem;
                line-height: 1.6;
            }

            /* Message */
            .message-block {
                padding: 0.875rem 1rem;
                border-left: 4px solid var(--color-accent);
                background-color: var(--color-surface);
                font-size: 1rem;
                margin-top: 1rem;
            }

            /* Clock */
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

            /* Footer */
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

            /* Responsive */
            @media (min-width: 768px) {
                .page-wrapper {
                    padding: 2.5rem 2rem;
                }
            }
        </style>
    </head>

    <body>
        <div class="page-wrapper">

            <header class="site-header">
                <h1>會員登入</h1>
            </header>

            <form action="/login" method="post" novalidate>
                <div class="d-flex flex-column gap-3">

                    <div>
                        <label for="account" class="swiss-form-label">帳號：</label>
                        <input type="text" id="account" name="account" class="swiss-form-control" required>
                    </div>

                    <div>
                        <label for="password" class="swiss-form-label">密碼：</label>
                        <input type="password" id="password" name="password" class="swiss-form-control"
                            pattern="[a-zA-Z0-9]+" title="密碼僅限英文字母或數字" required>
                    </div>

                    <div class="d-flex flex-wrap gap-2 mt-2">
                        <input type="submit" id="btn-login-submit" class="swiss-btn" value="登入">
                        <input type="reset" id="btn-login-reset" class="swiss-btn swiss-btn--outline" value="重置">
                        <button type="button" id="btn-login-home" class="swiss-btn swiss-btn--outline"
                            onclick="window.location.href='/index'">
                            首頁
                        </button>
                    </div>
                </div>
            </form>

            <% String loginMsg=(String) request.getAttribute("message"); if (loginMsg==null) loginMsg=(String)
                session.getAttribute("message"); if (loginMsg !=null && !loginMsg.isEmpty()) { %>
                <p class="message-block" id="login-message">
                    <%= loginMsg %>
                </p>
                <% } %>

            <hr class="swiss-divider">

            <section class="info-block" aria-label="Session 與 Cookie 說明">
                <h3>🔐 Session 與 Cookie 說明</h3>
                <p>本系統採用 <strong>Server-side Session</strong> 技術維護您的登入狀態，</p>
                <p>並透過 <strong>HttpOnly Cookie</strong> 儲存會話識別碼，有效防止 XSS 攻擊並保障會員的隱私。</p>
            </section>

            

                    <hr class="swiss-divider">

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