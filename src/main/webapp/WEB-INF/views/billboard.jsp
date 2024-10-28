<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <!-- Link CSS files -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/billboard.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/vendor.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&family=Marcellus&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

      <section id="billboard" class="bg-light py-5">
        <div class="container">
          <div class="row justify-content-center">
            <h1 class="section-title text-center mt-4" data-aos="fade-up">New Collections</h1>
            <div class="col-md-6 text-center" data-aos="fade-up" data-aos-delay="300">
                <p>Discover the latest trends crafted with elegance and innovation. Embrace styles that redefine comfort and luxury, designed to elevate your look for any occasion. Dive into our curated collection and make a statement that’s uniquely you!</p>
            </div>
          </div>
          <div class="row">
            <div class="swiper main-swiper py-4" data-aos="fade-up" data-aos-delay="600">
              <div class="swiper-wrapper d-flex border-animation-left">
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-6_tfbdy9.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Soft leather jackets</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-1_y4pxmv.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Soft leather jackets</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-2_rjjm6f.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Soft leather jackets</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-3_jcfn4y.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Soft leather jackets</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-4_ouv85k.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Out crop sweater</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="banner-item image-zoom-effect">
                    <div class="image-holder">
                      <a href="#">
                        <img src="https://res.cloudinary.com/dbleggv6z/image/upload/v1729940612/RevShop/banner-image-5_tue4tl.jpg" alt="product" class="img-fluid">
                      </a>
                    </div>
                    <div class="banner-content py-4">
                      <h5 class="element-title text-uppercase">
                        <a href="index.html" class="item-anchor">Soft leather jackets</a>
                      </h5>
                      <p>Scelerisque duis aliquam qui lorem ipsum dolor amet, consectetur adipiscing elit.</p>
                      <div class="btn-left">
                        <a href="#" class="btn-link fs-6 text-uppercase item-anchor text-decoration-none">Discover Now</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-pagination"></div>
            </div>
            <div class="icon-arrow icon-arrow-left"><svg width="50" height="50" viewBox="0 0 24 24">
                <use xlink:href="#arrow-left"></use>
              </svg></div>
            <div class="icon-arrow icon-arrow-right"><svg width="50" height="50" viewBox="0 0 24 24">
                <use xlink:href="#arrow-right"></use>
              </svg></div>
          </div>
        </div>
      </section>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/SmoothScroll.js"></script>
      <script src="<%= request.getContextPath() %>/js/jquery.min.js"></script>
          <script src="<%= request.getContextPath() %>/js/plugins.js"></script>
          <script src="<%= request.getContextPath() %>/js/SmoothScroll.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
              crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
          <script src="<%= request.getContextPath() %>/js/script.min.js"></script>
</body>
</html>
