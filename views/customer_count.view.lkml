view: customer_count {
  derived_table: {
    explore_source: fact_customer_transaction {
      column: customer_cd { field: fact_customer_transaction.customer_cd }
      column: store_cd { field: fact_customer_transaction.store_cd }
      column: date_cd { field: fact_customer_transaction.date_cd }
    }
  }
  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.customer_cd ;;
  }
  dimension: store_cd {
    label: "STORE_CD"
    type: string
    sql: ${TABLE}.store_cd ;;
  }
  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.date_cd ;;
  }
  dimension: type {
    label: "TYPE"
    type: string
    sql: "Current Customer" ;;
  }
  measure: count_customer {
    label: "COUNT_CUSTOMER_TY"
    type: count_distinct
    sql: ${customer_cd} ;;
  }
}
