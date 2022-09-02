view: avg_sales {
  derived_table: {
    explore_source: fact_customer_transaction {
      column: customer_cd { field: fact_customer_transaction.customer_cd }
      # column: store_cd { field: fact_customer_transaction.store_cd }
      column: avg_sales { field: fact_customer_transaction.avg_sales }
      column: sum_avg_sales { field: fact_customer_transaction.sum_avg_sales }
    }
  }
  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.customer_cd ;;
  }
  # dimension: store_cd {
  #   label: "STORE_CD"
  #   type: string
  #   sql: ${TABLE}.store_cd ;;
  # }
  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.date_cd ;;
  }
  # dimension: type {
  #   label: "TYPE"
  #   type: string
  #   sql: "Current Customer" ;;
  # }
  measure: count_customer {
    label: "COUNT_CUSTOMER_TY"
    type: count_distinct
    sql: ${customer_cd} ;;
  }
  measure: avg_sales {
    label: "AVG_SALES"
    type: sum
    sql: ${TABLE}.avg_sales ;;
  }
  measure: sum_avg_sales {
    label: "SUM_AVG_SALES"
    type: sum
    sql: ${TABLE}.sum_avg_sales ;;
  }
  measure: avg_sales_number {
    label: "AVG_SALES_NUMBER"
    type: number
    sql: ${TABLE}.sum_avg_sales ;;
  }
  measure: total_avg_sales {
    label: "TOTAL_AVG_SALES"
    type: number
    value_format: "#,###.00"
    sql: ${sum_avg_sales} ;;
  }
}
