import axios from "axios";

const api = axios.create({
  // sever
  //baseURL: 'https://bcsswp.azurewebsites.net',
  // local
  baseURL: "https://localhost:7116",
});

const authen = localStorage.getItem("Authen");

// Request interceptor
if (authen != null) {
  console.log(authen);
  api.interceptors.request.use(
    function (config) {
      config.headers.Authorization = `Bearer ${authen}`;
      return config;
    },
    function (error) {
      return Promise.reject(error);
    }
  );
}

// Response interceptor
api.interceptors.response.use(
  function (response) {
    if (response.data && response.data.data) {
      response.data = response.data.data;
    }
    return response;
  },
  function (error) {
    return Promise.reject(error);
  }
);

export default api;

// import axios from "axios";
// import { useNavigate } from "react-router-dom";

// // const navigate = useNavigate();

// const api = axios.create({
//   baseURL: "https://localhost:7116",
// });

// api.interceptors.request.use(
//   async function (config) {
//     const token = localStorage.getItem("Authen");
//     if (token) {
//       const tokenExpiration = localStorage.getItem("AuthenExpiration");
//       if (tokenExpiration && Date.now() >= tokenExpiration) {
//         try {
//           const refreshedToken = await refreshAuthToken(); // Implement this function to refresh the token
//           if (refreshedToken) {
//             localStorage.setItem("Authen", refreshedToken.token);
//             localStorage.setItem("AuthenExpiration", refreshedToken.expiration);
//             config.headers.Authorization = `Bearer ${refreshedToken.token}`;
//           } else {
//             // Redirect the user to the login page if token refresh fails
//             // Example: window.location.href = '/login';
//             // navigate('/login')
//           }
//         } catch (error) {
//           // Handle token refresh error
//           console.error("Token refresh error:", error);
//           // Redirect the user to the login page if token refresh fails
//           // Example: window.location.href = '/login';
//           // navigate('/login')
//         }
//       } else {
//         config.headers.Authorization = `Bearer ${token}`;
//       }
//     }
//     return config;
//   },
//   function (error) {
//     return Promise.reject(error);
//   }
// );

// // Response interceptor
// api.interceptors.response.use(
//   function (response) {
//     if (response.data && response.data.data) {
//       response.data = response.data.data;
//     }
//     return response;
//   },
//   function (error) {
//     return Promise.reject(error);
//   }
// );

// // Function to refresh the authentication token
// async function refreshAuthToken() {
//   try {
//     // Make a request to your server to refresh the token using a refresh token
//     const refreshToken = localStorage.getItem("RefreshToken"); // Get the refresh token from localStorage
//     const response = await axios.post("https://localhost:7116/refresh-token", {
//       refresh_token: refreshToken,
//     });

//     // Assuming the server responds with a new access token and its expiration time
//     const newToken = response.data.access_token;
//     const newTokenExpiration = Date.now() + response.data.expires_in * 1000; // Calculate the new token's expiration time

//     return { token: newToken, expiration: newTokenExpiration };
//   } catch (error) {
//     // Handle token refresh error
//     console.error("Token refresh error:", error);
//     return null; // Return null to indicate token refresh failure
//   }
// }

// export default api;
