import { useEffect, useState } from 'react'
import { BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, LineChart, Line }from 'recharts';
import { FaBox, FaMoneyBillWave, FaShoppingCart, FaUsers } from 'react-icons/fa';
import api from '../../../../components/utils/requestAPI';
import './Dashboard.css';

const InventoryDashboard = () => {

    const [allProducts, setAllProducts] = useState();

    const fetchData = async () => {
        const url = "/api/Product/Count-all-products";
        try {
            const response = await api.get(url);
            console.log(response.data);
            setAllProducts(response.data);
        } catch (error) {
            console.error(error);
        }
    };

    useEffect(() => {
        fetchData();
    }, []);

    const data = [
        {
            month: 1,
            cage: 100,
            food: 22,
            toy: 12,
            custom: 9
        },
        {
            month: 2,
            cage: 107,
            food: 58,
            toy: 20,
            custom: 10
        },
        {
            month: 3,
            cage: 84,
            food: 30,
            toy: 41,
            custom: 17
        },
        {
            month: 4,
            cage: 63,
            food: 39,
            toy: 19,
            custom: 17
        },
        {
            month: 5,
            cage: 74,
            food: 48,
            toy: 30,
            custom: 15
        },
        {
            month: 6,
            cage: 63,
            food: 30,
            toy: 52,
            custom: 6
        },
        {
            month: 7,
            cage: 55,
            food: 43,
            toy: 20,
            custom: 4
        },
        {
            month: 8,
            cage: 72,
            food: 22,
            toy: 36,
            custom: 13
        },
        {
            month: 9,
            cage: 86,
            food: 68,
            toy: 54,
            custom: 12
        },
        {
            month: 10,
            cage: 61,
            food: 23,
            toy: 37,
            custom: 5
        },
        {
            month: 11,
            cage: 50,
            food: 34,
            toy: 20,
            custom: 10
        },
        {
            month: 12,
            cage: 0,
            food: 0,
            toy: 0,
            custom: 0
        }
    ];



    // function formatCash(currency) {
    //     return currency?.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    // }

    const getTotalQuantity = (data) => {
        const totalQuantity = data.reduce((acc, entry) => acc + entry.cage + entry.food + entry.toy, 0);
        return totalQuantity;
    };

    const getTotalQuantitySold = (data) => {
        const totalQuantitySold = data.reduce((acc, entry) => acc + entry.cage + entry.food + entry.toy + entry.custom, 0);
        return totalQuantitySold;
    };

    // sản phẩm bán chạy nhất
    const getBestSellingProduct = () => {
        const products = data.map(entry => ({
            name: 'lồng',
            quantity: entry.cage,
        }, {
            name: 'thức ăn',
            quantity: entry.food,
        }, {
            name: 'phụ kiện - đồ chơi',
            quantity: entry.toy,
        }));

        const totalQuantities = {};

        products.forEach(product => {
            const { name, quantity } = product;
            totalQuantities[name] = (totalQuantities[name] || 0) + quantity;
        });

        const bestSellingProduct = Object.keys(totalQuantities).reduce((a, b) =>
            totalQuantities[a] > totalQuantities[b] ? a : b
        );

        return bestSellingProduct;
    };

    return (
        <div className='dashboard'>
            <main className='main-container'>
                <h3 className='main-title'>BẢNG THỐNG KÊ HÀNG HÓA</h3>
                <div className='main-cards'>
                    <div className='card'>
                        <div className='card-inner'>
                            <h3>TỔNG SỐ LƯỢNG</h3>
                            <FaBox className='card_icon' />
                        </div>
                        <h1>{getTotalQuantity(data) + 20000}</h1>
                    </div>
                    <div className='card'>
                        <div className='card-inner'>
                            <h3>TỔNG SỐ LƯỢNG ĐÃ BÁN</h3>
                            <FaBox className='card_icon' />
                        </div>
                        <h1>{getTotalQuantitySold(data)}</h1>
                    </div>
                    <div className='card'>
                        <div className='card-inner'>
                            <h3>SẢN PHẨM BÁN CHẠY NHẤT</h3>
                            <FaBox className='card_icon' />
                        </div>
                        <h1 className='card-text'>Avian Adventures Grande Dometop Cage</h1>
                    </div>
                </div>

                <div className='charts'>
                    <div className="chart order">
                        <h3 className="chart-title">TỔNG SỐ LƯỢNG ĐÃ BÁN</h3>
                        <ResponsiveContainer width="100%" height="100%">
                            <BarChart
                                width={1000}
                                height={600}
                                data={data}
                                margin={{
                                    top: 5,
                                    right: 30,
                                    left: 20,
                                    bottom: 5,
                                }}
                            >
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="month" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Bar dataKey="cage" fill="#8884d8" name='lồng' />
                                <Bar dataKey="food" fill="#4484d8" name='thức ăn' />
                                <Bar dataKey="toy" fill="#888888" name='phụ kiện đồ chơi' />
                                <Bar dataKey="custom" fill="#8664d6" name='lồng thiết kế' />
                            </BarChart>
                        </ResponsiveContainer>
                    </div>
                </div>
            </main>
        </div>
    )
}

export default InventoryDashboard