view: a_growth {
    derived_table: {
      sql:
          WITH
          fact_customer_transaction AS (
          SELECT
          *
          FROM `CDP.FACT_CUSTOMER_TRANSACTION`
          ),


        SELECT
        *
        FROM fact_customer_transaction
        ;;
    }
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
    measure: purchase_value_before_tax {
      label: "PURCHASE_VALUE_BEFORE_TAX"
      type: sum
      sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
    }
  }
