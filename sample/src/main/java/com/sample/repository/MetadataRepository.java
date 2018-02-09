package com.sample.repository;

import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MetadataRepository {

  @Autowired
  private EntityManager entityManager;

  public Set<EntityType<?>> getEntityTypes() {
    Metamodel model = entityManager.getEntityManagerFactory().getMetamodel();
    return model.getEntities();
  }
}