connection: "cdp"
label: " CDP Dashboard"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

############################################################################
# fact_store_sales
explore: fact_store_sales {
  label: "FACT_STORE_SALES"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_store_sales.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_store {
    relationship: many_to_one
    sql_on: ${fact_store_sales.store_cd} = ${dim_store.store_cd} ;;
  }
}

# fact_customer
explore: fact_customer {
  label: "FACT_CUSTOMER"
  join: dim_date{
    relationship: many_to_one
    sql_on: ${fact_customer.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_store {
    relationship: many_to_one
    sql_on: ${fact_customer.store_cd} = ${dim_store.store_cd} ;;
  }

  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_customer.customer_cd} = ${dim_customer.customer_cd} ;;
  }
}

#fact_customer_transaction
explore: fact_customer_transaction {
  label: "FACT_CUSTOMER_TRANSACTION"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_customer_transaction.date_cd} = ${dim_date.date_cd};;
  }

  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_customer_transaction.customer_cd} = ${dim_customer.customer_cd};;
  }

  join: dim_store {
    relationship: many_to_one
    sql_on: ${fact_customer_transaction.store_cd} = ${dim_store.store_cd} ;;
  }

  join: dim_product {
    relationship: many_to_one
    sql_on: ${fact_customer_transaction.product_cd} = ${dim_product.product_cd};;
  }
  join: buying_pattern {
    relationship: many_to_one
    sql_on: ${fact_customer_transaction.customer_cd} = ${buying_pattern.customer_cd} ;;
  }
}

#fact_promotion
explore: fact_promotion {
  label: "FACT_PROMOTION"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_promotion.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_promotion.customer_cd} = ${dim_customer.customer_cd} ;;
  }

  join: dim_product {
    relationship: many_to_one
    sql_on: ${fact_promotion.product_cd} = ${dim_product.product_cd} ;;
  }

  join: dim_promotion {
    relationship: many_to_one
    sql_on: ${fact_promotion.promotion_cd} = ${dim_promotion.promotion_cd} ;;
  }
}
#fact_customer_segment
explore: fact_customer_segment {
  label: "FACT_CUSTOMER_SEGMENT"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_customer_segment.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_customer_segment.customer_cd} = ${dim_customer.customer_cd} ;;
  }
  join: dim_store {
    relationship: many_to_one
    sql_on: ${fact_customer_segment.store_cd} = ${dim_store.store_cd} ;;
  }
  join: dim_segment {
    relationship: many_to_one
    sql_on: ${fact_customer_segment.segment_cd} = ${dim_segment.segment_cd} ;;
  }
}
# CURRENT_SEGMENT_CD
#fact_product_cost
explore: fact_product_cost {
  label: "FACT_PRODUCT_COST"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_product_cost.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_product {
    relationship: many_to_one
    sql_on: ${fact_product_cost.product_cd} = ${dim_product.product_cd} ;;
  }
}

explore: buying_pattern {
  label: "BUYING_PATTERN"
  join: dim_customer {
    relationship: many_to_one
    sql_on: ${buying_pattern.customer_cd} = ${dim_customer.customer_cd} ;;
  }
}

explore: example_datediff{
  label: "DATE_DIFF"
}

# fact_basket_analysis
# BASE_PRODUCT_CD
# REC_PRODUCT_CD

explore: fact_basket_analysis {
  label: "FACT_BASKET_ANALYSIS"
  join: dim_product{
    relationship: many_to_one
    sql: ${fact_basket_analysis.base_product_cd} = ${dim_product.product_cd} ;;
  }
  # join: dim_product{
  #   relationship: many_to_one
    # sql: ${fact_basket_analysis.rec_product_cd} = ${dim_product.product_cd} ;;
  # }
}

# fact_customer_status
explore: fact_customer_status {
  label: "FACT_CUSTOMER_STATUS"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_customer_status.date_cd} = ${dim_date.date_cd} ;;
  }
  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_customer_status.customer_cd} = ${dim_customer.customer_cd} ;;
  }
}

explore: growth_yoy {
  # label: "GROWTH_YOY"
  # join: dim_date {
  #   relationship: many_to_one
  #   sql_on: ${growth_yoy.date_cd}.date_cd} = ${dim_date.date_cd} ;;
  # }
}
explore: a_growth {
    label: "A_GROWTH"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${a_growth.date_cd} = ${dim_date.date_cd} ;;
  }
}
explore: fact_product_reccomend {
  join: dim_customer {
    relationship: many_to_one
    sql_on: ${fact_product_reccomend.customer_cd} = ${dim_customer.customer_cd} ;;
  }
  join: dim_product {
    relationship: many_to_one
    sql: ${fact_product_reccomend.base_product_cd} = ${dim_product.product_cd} ;;
  }
}
