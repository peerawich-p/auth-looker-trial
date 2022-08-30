view: total_sale_transaction {
  derived_table: {
    explore_source: fact_customer_transaction {
      column: sales { field: fact_customer_transaction.total_sale }
      column: store { field: fact_customer_transaction.store_cd }
      # column: store_cd {field:dim_store.store.cd}

      derived_column: total_sales {
        # sql: SUM(sales) OVER() ;;
        sql: SUM(sales);;
      }
      derived_column: total_store {
        # sql: SUM(sales) OVER() ;;
        sql: count(store);;
      }

    }
  }
  dimension: store_cd {}
  dimension: sales {
   label: "Sales"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: store {
    label: "Store"
    value_format: "$#,##0.00"
    type: number
  }
  # dimension: category {}

  dimension: total_store {
    type: number
    # value_format: "$#,##0.00"
  }

  measure: avg_sales {
    label: "AVG_SALES"
    type: number
    sql: SUM(sales) / SUM(total_store) ;;
    # value_format_name: percent_1
  }
}
