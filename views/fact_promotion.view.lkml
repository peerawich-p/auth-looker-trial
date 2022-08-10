view: fact_promotion {
sql_table_name: CDP.FACT_PROMOTION ;;
dimension: date_cd {
  label: "DATE_CD"
  type: date_time
  sql: ${TABLE}.DATE_CD ;;
}
dimension: customer_cd {
  label: "CUSTOMER_CD"
  type: string
  sql: ${TABLE}.CUSTOMER_CD ;;
}
dimension: product_cd {
  label: "PRODUCT_CD"
  type: string
  sql: ${TABLE}.PRODUCT_CD ;;
}
dimension: promotion_cd {
  label: "PROMOTION_CD"
  type: string
  sql: ${TABLE}.PROMOTION_CD ;;
}
}
