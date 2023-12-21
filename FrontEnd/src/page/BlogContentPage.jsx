import React, { useState } from "react";
import { useParams } from "react-router-dom";
import { useEffect } from "react";
import useAuth from "../hooks/useAuth";
import api from "../components/utils/requestAPI";
import RelatedPost from "../components/related-post/RelatedPost";
import "./BlogContentPage.css";

const BlogContentPage = () => {
  const { blogId } = useParams();
  const { auth } = useAuth();
  const [blog, setBlog] = useState(null);

  const fetchData = async () => {
    const url = "/api/Blog/get-blog-by-id";
    const data = {
      blogID: blogId,
    };
    try {
      const response = await api.post(url, data);
      console.log(response.data);
      setBlog(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const formatContent = (description) => {
    const paragraphs = description?.split("\\n");
    console.log(paragraphs)
    return paragraphs?.map((paragraph, index) => (
      <p key={index} className="product-information-detail-description">
        {paragraph}
      </p>
    ));
  };

  function formatDate(date) {
    const d = new Date(date);
    const day = d.getDate().toString().padStart(2, "0");
    const month = (d.getMonth() + 1).toString().padStart(2, "0");
    const year = d.getFullYear();
    return `${day}/${month}/${year}`;
  }

  // if (auth?.user?.roleId === "3") {
  //   return (
  //     <div className="blog-content-page">
  //       <div key={blog?.blogId} className="blog-content-item">
  //         <div className="blog-content-item-information">
  //           <h2 className="blog-content-title">{blog?.blogTitle}</h2>
  //           <p className="blog-content-meta">
  //             <span className="blog-content-date">
  //               {formatDate(blog?.createAt)}
  //             </span>{" "}
  //             .{" "}
  //             <span className="blog-content-author">
  //               bởi {blog?.user.fullName}
  //             </span>
  //           </p>
  //         </div>
  //         <div className="blog-content-section">
  //           <img
  //             className="blog-content-section-image"
  //             src={blog?.image[0].imageUrl}
  //             alt="blog-content-image"
  //           />
  //           <h3 className="blog-content-section-heading">{blog?.blogTitle}</h3>
  //           {formatContent(blog?.blogContent)}
  //         </div>
  //       </div>
  //       <RelatedPost blogType={blog?.blogType} />
  //     </div>
  //   );
  // } else {
    return (
      <div className="blog-content-page">
        <div key={blog?.blogId} className="blog-content-item">
          <div className="blog-content-item-information">
            <h2 className="blog-content-title">{blog?.blogTitle}</h2>
            <p className="blog-content-meta">
              <span className="blog-content-date">
                {formatDate(blog?.createAt)}
              </span>{" "}
              .{" "}
              <span className="blog-content-author">
                bởi {blog?.user.fullName}
              </span>
            </p>
          </div>
          <div className="blog-content-section">
            <img
              className="blog-content-section-image"
              src={blog?.image[0].imageUrl}
              alt="blog-content-image"
            />
            <h3 className="blog-content-section-heading">{blog?.blogTitle}</h3>
            {formatContent(blog?.blogContent)}
          </div>
        </div>
        <RelatedPost blogType={blog?.blogType} />
      </div>
    );
  // }
};

export default BlogContentPage;
