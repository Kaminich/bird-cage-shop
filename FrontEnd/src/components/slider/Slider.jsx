import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { FaAngleLeft, FaAngleRight } from "react-icons/fa";
import Slide1 from "/Slide 1.png";
import Slide2 from "/Slide 2.png";
import "./Slider.css";

const Slider = () => {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const images = [Slide1, Slide2];

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentImageIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, 2500);

    return () => clearInterval(interval);
  }, [images.length]);

  const nextImage = () => {
    setCurrentImageIndex((prevIndex) => (prevIndex + 1) % images.length);
  };

  const previousImage = () => {
    setCurrentImageIndex((prevIndex) =>
      prevIndex === 0 ? images.length - 1 : prevIndex - 1
    );
  };

  return (
    <div className="slider-section">
      <div className="slider-container">
        <button
          className="slider-button slider-button-left"
          onClick={previousImage}
        >
          <FaAngleLeft className="angle-left" />
        </button>
        <img
          className="slider-image"
          src={images[currentImageIndex]}
          alt="Slider"
        />
        <button
          className="slider-button slider-button-right"
          onClick={nextImage}
        >
          <FaAngleRight className="angle-right" />
        </button>
      </div>
      <div className="product-section">
        <div className="custom-product-box-section">
          <Link to="/custom-cage" className="custom-product-box">
            <img
              className="custom-product-box-image"
              src="/customcage.png"
              alt="custom-product"
            />
            <h3 className="custom-product-box-heading">Thiết kế lồng chim</h3>
            <h3 className="custom-product-box-heading">
              theo sở thích của bạn
            </h3>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Slider;
