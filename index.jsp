<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.store.service.ProductService" %>
<%@ page import="com.store.model.Product" %>
<%@ page import="java.util.List" %>
<%
    ProductService service = new ProductService();
    String selectedCategory = request.getParameter("category");
    List<Product> products = service.getProductsByCategory(selectedCategory);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THREAD &amp; CO. — Autumn/Winter Essentials</title>
    <style>
        :root {
            --bg: #0f1115;
            --surface: #181b22;
            --surface-hover: #222733;
            --accent: #ff6b4a;
            --text-main: #f0f2f5;
            --text-sub: #9ca3af;
            --card-border: #292f3d;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: var(--surface);
            border-bottom: 1px solid var(--card-border);
            padding: 1.25rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 800;
            letter-spacing: 1.5px;
            color: var(--accent);
            text-transform: uppercase;
        }

        .cart-status {
            background: rgba(255, 107, 74, 0.15);
            color: var(--accent);
            padding: 0.4rem 0.9rem;
            border-radius: 999px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .hero {
            padding: 3rem 2rem 2rem;
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
        }

        .hero h1 {
            font-size: 2.75rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 0.75rem;
        }

        .hero p {
            color: var(--text-sub);
            font-size: 1.1rem;
        }

        .nav-filters {
            display: flex;
            justify-content: center;
            gap: 0.75rem;
            margin: 1.5rem 0 2.5rem;
            flex-wrap: wrap;
        }

        .nav-filters a {
            text-decoration: none;
            color: var(--text-sub);
            background: var(--surface);
            border: 1px solid var(--card-border);
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .nav-filters a:hover, .nav-filters a.active {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1.5rem 4rem;
            width: 100%;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.75rem;
        }

        .card {
            background: var(--surface);
            border: 1px solid var(--card-border);
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.2s ease, border-color 0.2s ease;
        }

        .card:hover {
            transform: translateY(-4px);
            border-color: var(--accent);
        }

        .card-img-placeholder {
            height: 200px;
            background: linear-gradient(135deg, #1f2430 0%, #151820 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .tag-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: var(--accent);
            color: #fff;
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.25rem 0.6rem;
            border-radius: 4px;
        }

        .card-body {
            padding: 1.25rem;
        }

        .category-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            color: var(--text-sub);
            letter-spacing: 1px;
            margin-bottom: 0.35rem;
        }

        .product-title {
            font-size: 1.15rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: #fff;
        }

        .card-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1.25rem;
            border-top: 1px solid var(--card-border);
        }

        .price {
            font-size: 1.25rem;
            font-weight: 700;
            color: #fff;
        }

        .buy-btn {
            background: transparent;
            color: var(--accent);
            border: 1px solid var(--accent);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        .buy-btn:hover {
            background: var(--accent);
            color: #fff;
        }

        footer {
            margin-top: auto;
            background: var(--surface);
            border-top: 1px solid var(--card-border);
            text-align: center;
            padding: 1.5rem;
            font-size: 0.85rem;
            color: var(--text-sub);
        }
    </style>
</head>
<body>

    <header>
        <div class="logo">Thread &amp; Co.</div>
        <div class="cart-status">CI/CD Deployed via Tomcat</div>
    </header>

    <section class="hero">
        <h1>Understated Style.<br>Crafted For Comfort.</h1>
        <p>Explore our premium collections crafted from sustainable fabrics and timeless silhouettes.</p>
        
        <div class="nav-filters">
            <a href="index.jsp" class="<%= (selectedCategory == null) ? "active" : "" %>">All Products</a>
            <a href="index.jsp?category=Men" class="<%= ("Men".equalsIgnoreCase(selectedCategory)) ? "active" : "" %>">Men</a>
            <a href="index.jsp?category=Women" class="<%= ("Women".equalsIgnoreCase(selectedCategory)) ? "active" : "" %>">Women</a>
            <a href="index.jsp?category=Unisex" class="<%= ("Unisex".equalsIgnoreCase(selectedCategory)) ? "active" : "" %>">Unisex</a>
        </div>
    </section>

    <main class="container">
        <div class="grid">
            <% for (Product item : products) { %>
                <div class="card">
                    <div class="card-img-placeholder">
                        <span class="tag-badge"><%= item.getTag() %></span>
                        <svg width="48" height="48" fill="none" stroke="#4b5563" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                        </svg>
                    </div>
                    <div class="card-body">
                        <div class="category-label"><%= item.getCategory() %></div>
                        <h2 class="product-title"><%= item.getName() %></h2>
                    </div>
                    <div class="card-footer">
                        <span class="price">&#8377;<%= String.format("%,.2f", item.getPrice()) %></span>
                        <button class="buy-btn" onclick="alert('Item added to cart!')">Add to Cart</button>
                    </div>
                </div>
            <% } %>
        </div>
    </main>

    <footer>
        &copy; 2026 Thread &amp; Co. Apparel &bull; Built with Maven &bull; Deployed via Automated CI/CD
    </footer>

</body>
</html>
