view: growth_yoy {
    derived_table: {
      explore_source: fact_customer_transaction {
        column: purchase_value_before_tax {}
        column: product_cd {}
        column: store_cd {}
        column: year_current {}
        column: year_previous {}
      }
    }
    dimension: purchase_value_before_tax {
      label: "PURCHASE_VALUE_BEFORE_TAX"
      type: number
    }
    dimension: product_cd {
      label: "PRODUCT_CD"
    }
    dimension: store_cd {
      label: "STORE_CD"
    }
    dimension: year_current {
      label: "YEAR_CURRENT"
      type: number
    }
    dimension: year_previous {
      label: "YEAR_PREVIOUS"
      type: number
    }
  measure: sale_ty {
    label: "SALE TY"
    type: sum
    sql: case when ${year_current}-1 = {year_previous} then ${purchase_value_before_tax};;
  }
  }
