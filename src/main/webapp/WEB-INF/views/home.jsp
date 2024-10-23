<%@ include file="header.jsp" %>
<%@ include file="slide.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .container-product {

        /* margin-left: 15px; */
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr; /* Chia header thành hai cột */
        align-items: center; /* Căn các phần tử theo chiều dọc */
        /* height: 200px; */
    }

    .product {


        margin-top: 16px;

    }

    .imfomation {
        height: 50px;
        text-align: center;
        padding-top: 10px;


    }

    .imfomation2 {
        height: 50px;
        text-align: center;
        padding-top: 20px;


    }

    .img-product {
        height: 350px;
        text-align: center;
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>
<div class="container">

    <div class="row">
        <div class="imfomation2">
            <h4>THỜI TRANG HOT NHẤT</h4>
        </div>
        <div class="container-product">
            <c:forEach var="spChiTiet" items="${spChiTietList}">
                <div class="product" style="margin-top: 40px;width: 280px">

                    <div class="img-product">
                        <a href="/assignment/home/chi-tiet-san-pham"><img src="${spChiTiet.hinhAnh}" alt="" height="350px"></a>
                    </div>

                    <div class="imfomation">
                        <h6>${spChiTiet.sanPham.tenSP}(${spChiTiet.maSPCT})</h6>
                        <h6>${spChiTiet.donGia}</h6>
                        <div class="row">
                            <h6><span><a href="delete-spct?id=${spChiTiet.id}">Xoa</a></span> <span><a
                                    href="update-spct/${spChiTiet.id}">Sua</a></span></h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <div class="row" style="text-align: center;">
        <span style="margin-top: 30px;">
            <a href="/assignment/them-san-pham">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-lg"
                     viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                </svg>
            </a>
        </span>
    </div>

</div>