view: sale_ly {
 derived_table: {
  explore_source: fact_store_sales {
    # column: customer_cd { field: fact_store_sales.customer_cd }
    # column: store_cd { field: fact_store_sales.store_cd }
    column: date_cd { field: fact_store_sales.date_cd }
    column: sales { field: fact_store_sales.purchase_value_before_tax}
    # column: avg_sales { field: fact_store_sales.avg_sales }
    # column: sum_avg_sales { field: fact_store_sales.sum_avg_sales }
  }
}
dimension: date_cd {
  label: "DATE_CD"
  type: date_time
  sql: ${TABLE}.date_cd ;;
}
# parameter: base_year {
#   type: unquoted
# }
measure: sales {
  label: "SALES"
  type: number
  sql: ${TABLE}.sales ;;
}
}
