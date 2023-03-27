package com.effective_mobile.service;


import com.effective_mobile.domain.Order;

public interface OrderService {
    void saveOrder(Order order);

    Order getOrder(Long id);
}
