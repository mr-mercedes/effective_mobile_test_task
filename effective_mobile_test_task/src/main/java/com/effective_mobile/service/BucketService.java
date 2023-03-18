package com.effective_mobile.service;

import com.effective_mobile.domain.Bucket;
import com.effective_mobile.domain.User;
import com.effective_mobile.dto.BucketDTO;

import java.util.List;

public interface BucketService {
    Bucket createBucket(User user, List<Long> productIds);
    void addProducts(Bucket bucket, List<Long> productIds);
    BucketDTO getBucketByUser(String name);
}
