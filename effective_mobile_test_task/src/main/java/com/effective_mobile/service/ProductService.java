package com.effective_mobile.service;

import com.effective_mobile.dto.ProductDTO;

import java.util.List;

public interface ProductService {
    List<ProductDTO> getAll();
    void addToUserBucket(Long productId, String username);
}
