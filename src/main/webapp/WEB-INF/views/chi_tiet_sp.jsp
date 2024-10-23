<html>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .product-image {
            max-width: 100%;
        }
        .thumbnail {
            max-width: 100%;
            margin-bottom: 10px;
        }
        .price {
            color: red;
            font-size: 24px;
        }
        .original-price {
            text-decoration: line-through;
            color: #999;
        }
        .discount {
            background-color: #333;
            color: white;
            border-radius: 50%;
            padding: 5px 10px;
            font-size: 14px;
        }
        .btn-buy {
            background-color: #d9534f;
            color: white;
            width: 100%;
        }
        .btn-add-to-cart {
            color: #d9534f;
        }
        .size-guide {
            color: red;
        }
        .product-details {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-2">
            <img alt="Thumbnail image of pants" class="thumbnail" height="200" src="https://storage.googleapis.com/a1aa/image/z50ugaRSL6o6GJgYg5uBXmfUO0unjP5uPCL9b0eYpJmIPWlTA.jpg" width="100"/>
            <img alt="Thumbnail image of pants" class="thumbnail" height="200" src="https://storage.googleapis.com/a1aa/image/z50ugaRSL6o6GJgYg5uBXmfUO0unjP5uPCL9b0eYpJmIPWlTA.jpg" width="100"/>
            <img alt="Thumbnail image of pants" class="thumbnail" height="200" src="https://storage.googleapis.com/a1aa/image/z50ugaRSL6o6GJgYg5uBXmfUO0unjP5uPCL9b0eYpJmIPWlTA.jpg" width="100"/>
            <img alt="Thumbnail image of pants" class="thumbnail" height="200" src="https://storage.googleapis.com/a1aa/image/z50ugaRSL6o6GJgYg5uBXmfUO0unjP5uPCL9b0eYpJmIPWlTA.jpg" width="100"/>
        </div>
        <div class="col-md-5">
            <img alt="Main image of pants" class="product-image" height="700" src="https://storage.googleapis.com/a1aa/image/l2OXvAoWdmLuABM6EflJeCX9SP934B0ofvpfeIenWQeeLPWlTA.jpg" width="500"/>
        </div>
        <div class="col-md-5">
            <h4>
                QUẦN TÂY TRƠN FORM SLIMFIT QT058 MÀU ĐEN
            </h4>
            <div class="d-flex align-items-center">
                <div class="me-2">
                    <i class="fas fa-star text-warning">
                    </i>
                    <i class="fas fa-star text-warning">
                    </i>
                    <i class="fas fa-star text-warning">
                    </i>
                    <i class="fas fa-star text-warning">
                    </i>
                    <i class="fas fa-star text-warning">
                    </i>
                </div>
                <div>
                    (61 đánh giá / 104 lượt mua)
                </div>
            </div>
            <div class="mt-2">
      <span class="price">
       299.000 đ
      </span>
                <span class="original-price ms-2">
       385.000 đ
      </span>
                <span class="discount ms-2">
       -22%
      </span>
            </div>
            <div class="mt-3">
                <h6>
                    MÀU KHÁC*
                </h6>
                <img alt="Thumbnail image of pants in different color" class="thumbnail" height="100" src="https://storage.googleapis.com/a1aa/image/spJjuXfBKPw9NiPQEeNmzFd6j591a1XoPMSiqkAJnAyJPWlTA.jpg" width="50"/>
            </div>
            <div class="mt-3">
                <h6>
                    SIZE*
                    <span class="size-guide">
        Hướng dẫn chọn size
       </span>
                </h6>
                <select class="form-select">
                    <option>
                        29
                    </option>
                    <!-- Add other sizes as needed -->
                </select>
            </div>
            <div class="mt-3">
                <h6>
                    SỐ LƯỢNG *
                </h6>
                <select class="form-select">
                    <option>
                        1
                    </option>
                    <!-- Add other quantities as needed -->
                </select>
            </div>
            <div class="mt-3">
                <button class="btn btn-buy">
                    <i class="fas fa-shopping-cart">
                    </i>
                    ĐĂNG KÝ MUA
                </button>
            </div>
            <div class="mt-2">
                <a class="btn-add-to-cart" href="#">
                    + Thêm vào giỏ hàng
                </a>
            </div>
            <div class="mt-3">
                <a href="#">
                    <i class="fas fa-map-marker-alt">
                    </i>
                    Xem địa chỉ còn sản phẩm này
                </a>
            </div>
            <div class="mt-3">
                <h6>
                    ĐIỂM NỔI BẬT
                </h6>
                <!-- Add product highlights here -->
            </div>
        </div>
    </div>
</div>
</body>
</html>