import React, { Fragment, useEffect, useState } from "react";
import { FaMinus, FaPlus } from "react-icons/fa";
import { useParams, useNavigate } from "react-router-dom";
import api from "../components/utils/requestAPI";
import useAuth from "../hooks/useAuth";
import ProductFeedbackList from "../components/feedback/ProductFeedbackList";
import Carousel from "../components/carousel/Carousel";
import PopupModal from "../components/modal/PopupModal";
import "../components/button/QuantityButton.css";
import "./ItemInformationPage.css";

const ItemInformation = () => {
  const { auth } = useAuth();
  const { action } = useParams();

  const { productId } = useParams();
  const [order, setOrder] = useState(null);
  const [product, setProduct] = useState(null);
  const [message, setMessage] = useState("");

  const [quantity, setQuantity] = useState(1);

  const [showPopup, setShowPopup] = useState(false);
  const [statusReturn, setStatusReturn] = useState(false);

  const current = new Date();
  const date = `${current.getFullYear()}-${current.getMonth() + 1
    }-${current.getDate()}`;

  const navigate = useNavigate();

  const decrementQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  const incrementQuantity = () => {
    setQuantity(quantity + 1);
  };

  useEffect(() => {
    const fetchData = async () => {
      const url = `/api/Product/get-by-id?id=${productId}`;
      try {
        const response = await api.get(url);
        console.log(response.data);
        setProduct(response.data);
      } catch (error) {
        console.error(error);
      }
    };
    fetchData();
  }, [productId]);

  useEffect(() => {
    if (product && product.quantity != null && product.quantity > 0) {
      setMessage("Sản phẩm có sẵn");
    } else {
      setMessage("Hết hàng");
    }
  }, [product]);

  useEffect(() => {
    const fetchData = async () => {
      const userid = auth?.user?.userId;
      const url = "/api/Order/get-not-paid";
      const data = {
        userID: userid,
      };
      try {
        const response = await api.post(url, data);
        setOrder(response.data);
        console.log(order);
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    };
    fetchData();
  }, [auth]);

  const handleShowPopup = async () => {
    setShowPopup(true);
  };

  const handleClose = () => {
    setShowPopup(false);
  };

  const handleSubmit = async () => {
    const userid = auth.user.userId;
    //if user have order
    if (typeof order[0]?.orderId !== "undefined") {
      const urlOrderDetail = "/api/OrderDetail/create-new";
      const data = {
        orderId: order[0].orderId,
        productId: productId,
        feedbackId: null,
        quantity: quantity,
      };
      console.log(data);
      try {
        const response = await api.post(urlOrderDetail, data);
        console.log(response.data);

        if (response) {
          const urlUpdate = "/api/Order/update-order-to-add-product";
          let total = order[0].total;
          total += response.data.price * response.data.quantity;
          const data = {
            orderId: order[0].orderId,
            userId: userid,
            note: "string",
            price: total,
          };
          try {
            const responseUpdate = await api.put(urlUpdate, data);
            console.log(responseUpdate.data);
            handleShowPopup();
          } catch (error) {
            console.error(error);
          }
        }
      } catch (error) {
        console.error(error);
      }
    }

    //If user do not have any order
    else {
      const urlOrder = "/api/Order/create-new";
      const userid = auth.user.userId;
      const data = {
        userID: userid,
        note: "string",
        createDate: date,
        total: 0,
      };
      try {
        const response = await api.post(urlOrder, data);
        console.log(response.data);
        if (response) {
          const urlOrderDetail = "/api/OrderDetail/create-new";
          const data = {
            orderId: response.data.orderId,
            productId: productId,
            feedbackId: null,
            quantity: quantity,
          };
          console.log(data);
          try {
            const responseOrderDetail = await api.post(urlOrderDetail, data);
            console.log(responseOrderDetail.data);
            if (responseOrderDetail) {
              const urlUpdate = "/api/Order/update-order-to-add-product";
              let total = 0;
              total +=
                responseOrderDetail.data.price *
                responseOrderDetail.data.quantity;
              const data = {
                orderId: response.data.orderId,
                userId: userid,
                note: "string",
                price: total,
              };
              try {
                const responseUpdate = await api.put(urlUpdate, data);
                console.log(responseUpdate.data);
                handleShowPopup();
              } catch (error) {
                console.error(error);
              }
            }
          } catch (error) {
            console.error(error);
          }
        }
      } catch (error) {
        console.error(error);
      }
    }
  };

  const handleAuth = async () => {
    if (auth.user) {
      const userid = auth.user.userId;
      console.log(userid);
      console.log(date);
      const url = "/api/Order/get-not-paid";
      const data = {
        userID: userid,
      };
      try {
        const response = await api.post(url, data);
        setOrder(response.data);
        console.log(response.data);
        console.log(order);
        handleSubmit();
      } catch (error) {
        console.error(error);
      }
    } else {
      navigate("/log-in");
    }
  };

  const formatDescription = (description) => {
    const paragraphs = description?.split("\\n");
    console.log(paragraphs)
    return paragraphs?.map((paragraph, index) => (
      <p key={index} className="product-information-detail-description">
        {paragraph}
      </p>
    ));
  };

  function formatCash(currency) {
    return currency?.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  }

  if (auth?.user?.roleId === "3" || auth?.user?.roleId === "2") {
    if (action === "view-product") {
      return (
        <div className="product-information-layout">
          <div className="product-information-container">
            <div className="product-information-image">
              <img src={product?.image[0]?.imageUrl} alt={product?.productName} />
            </div>
            <div className="product-information-summary">
              <h2 className="product-information-title">
                {product?.productName}
              </h2>
              <p className="product-information-price">
                ₫{formatCash(product?.price)}
              </p>
              <p className="product-information-description">
                Kích thước:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.sizeProduct[0]?.size.size1} -{" "}
                  {product?.sizeProduct[0]?.size.sizeDescription}
                </span>
              </p>
              <p className="product-information-description">
                Vật liệu:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.materialProduct[0]?.material.materialName}
                </span>
              </p>
              <p className="product-information-description">
                Màu sắc:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.colorProduct[0]?.color.colorName}
                </span>
              </p>
              <div className="quantity-section">
                <div className="quantity">
                  <button
                    className="quantity-button left"
                    onClick={decrementQuantity}
                  >
                    <FaMinus className="quantity-icon" />
                  </button>
                  <input
                    className="quantity-number"
                    type="number"
                    value={quantity}
                    readOnly
                  />
                  <button
                    className="quantity-button right"
                    onClick={incrementQuantity}
                  >
                    {" "}
                    <FaPlus className="quantity-icon" />
                  </button>
                </div>
                <p className="quantity-inventory">{message}</p>
              </div>
            </div>
          </div>

          <div className="product-information-detail">
            <h4 className="product-information-detail-heading">
              Mô tả sản phẩm
            </h4>
            {formatDescription(product?.description)}
          </div>

          <ProductFeedbackList productId={productId} action={"view-product"} />

          <div className="different-products-carousel">
            <h3 className="different-products-carousel-heading">
              Các sản phẩm tương tự
            </h3>
            <Carousel className="Cage" />
          </div>
        </div>
      );
    } else {
      return (
        <div className="product-information-layout">
          <div className="product-information-container">
            <div className="product-information-image">
              <img src={product?.image[0]?.imageUrl} alt={product?.productName} />
            </div>
            <div className="product-information-summary">
              <p className="product-information-description">
                Kích thước:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.sizeProduct[0]?.size.size1} -{" "}
                  {product?.sizeProduct[0]?.size.sizeDescription}
                </span>
              </p>
              <p className="product-information-description">
                Vật liệu:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.materialProduct[0]?.material.materialName}
                </span>
              </p>
              <p className="product-information-description">
                Màu sắc:{" "}
                <span className="custom-summary-total-detail-info">
                  {product?.colorProduct[0]?.color.colorName}
                </span>
              </p>

              <div className="quantity-section">
                <div className="quantity">
                  <button
                    className="quantity-button left"
                    onClick={decrementQuantity}
                  >
                    <FaMinus className="quantity-icon" />
                  </button>
                  <input
                    className="quantity-number"
                    type="number"
                    value={quantity}
                    readOnly
                  />
                  <button
                    className="quantity-button right"
                    onClick={incrementQuantity}
                  >
                    {" "}
                    <FaPlus className="quantity-icon" />
                  </button>
                </div>
                <p className="quantity-inventory">{message}</p>
              </div>
            </div>
          </div>

          <div className="product-information-detail">
            <h4 className="product-information-detail-heading">
              Mô tả sản phẩm
            </h4>
            {formatDescription(product?.description)}
          </div>

          <ProductFeedbackList productId={productId} action={"edit-product"} />

          <div className="different-products-carousel">
            <h3 className="different-products-carousel-heading">
              Các sản phẩm tương tự
            </h3>
            <Carousel className="Cage" />
          </div>
        </div>
      );
    }
  } else {
    return (
      <div className="product-information-layout">
        <div className="product-information-container">
          <div className="product-information-image">
            <img src={product?.image[0]?.imageUrl} alt={product?.productName} />
          </div>
          <div className="product-information-summary">
            <h2 className="product-information-title">
              {product?.productName}
            </h2>
            <p className="product-information-price">
              ₫{formatCash(product?.price)}
            </p>
            <p className="product-information-description">
              Kích thước:{" "}
              <span className="custom-summary-total-detail-info">
                {product?.sizeProduct[0]?.size.size1} -{" "}
                {product?.sizeProduct[0]?.size.sizeDescription}
              </span>
            </p>
            <p className="product-information-description">
              Vật liệu:{" "}
              <span className="custom-summary-total-detail-info">
                {product?.materialProduct[0]?.material.materialName}
              </span>
            </p>
            <p className="product-information-description">
              Màu sắc:{" "}
              <span className="custom-summary-total-detail-info">
                {product?.colorProduct[0]?.color.colorName}
              </span>
            </p>
            <div className="quantity-section">
              <div className="quantity">
                <button
                  className="quantity-button left"
                  onClick={decrementQuantity}
                >
                  <FaMinus className="quantity-icon" />
                </button>
                <input
                  className="quantity-number"
                  type="number"
                  value={quantity}
                  readOnly
                />
                <button
                  className="quantity-button right"
                  onClick={incrementQuantity}
                >
                  {" "}
                  <FaPlus className="quantity-icon" />
                </button>
              </div>
              <p className="quantity-inventory">{message}</p>
            </div>
            <button className="add-to-cart" onClick={handleAuth}>
              Thêm vào giỏ hàng
            </button>{" "}
          </div>
          {showPopup && (
            <PopupModal
              action={"success"}
              statusReturn={statusReturn}
              setStatusReturn={setStatusReturn}
              open={true}
              onClose={handleClose}
            />
          )}
        </div>

        <div className="product-information-detail">
          <h4 className="product-information-detail-heading">Mô tả sản phẩm</h4>
          {formatDescription(product?.description)}
        </div>

        <ProductFeedbackList productId={productId} />

        <div className="different-products-carousel">
          <h3 className="different-products-carousel-heading">
            Các sản phẩm tương tự
          </h3>
          <Carousel className="Cage" />
        </div>
      </div>
    );
  }
};

export default ItemInformation;
