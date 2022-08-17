view: fact_customer_transaction {

sql_table_name: CDP.FACT_CUSTOMER_TRANSACTION;;

dimension: median_diff_date {
    label: "MEDIAN_DIFF_DATE"
    type: number
    sql: ${TABLE}.MEDIAN_DIFF_DATE ;;
  }
dimension: date_cd {
  label: "DATE_CD"
  type: date_time
  sql: ${TABLE}.DATE_CD ;;
}
dimension: product_cd {
  label: "PRODUCT_CD"
  type: string
  sql: ${TABLE}.PRODUCT_CD ;;
}
dimension: store_cd {
  label: "STORE_CD"
  type: string
  sql: ${TABLE}.STORE_CD ;;
}
dimension: customer_cd {
  label: "CUSTOMER_CD"
  type: string
  sql: ${TABLE}.CUSTOMER_CD ;;
}
dimension: channel_cd {
  label: "CHANNEL_CD"
  type: string
  sql: ${TABLE}.CHANNEL_CD ;;
}
measure: items {
  label: "ITEMS"
  type: sum
  sql: CAST(${TABLE}.ITEMS as INTEGER);;
}
measure: basket_size  {
  label: "BASKET_SIZE"
  type: number
  sql: ${items}/${orders_count}  ;;
}
measure: min_date_cd {
  label: "MIN_DATE_CD"
  type: date
  sql: MIN(${date_cd}) ;;
}
measure: purchase_value_before_tax {
  label: "PURCHASE_VALUE_BEFORE_TAX"
  type: sum
  sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
}
measure: orders_count {
  label: "ORDERS_COUNT"
  type: sum
  sql: ${TABLE}.ORDERS_COUNT ;;
}
measure: bill_size {
  label: "BILL_SIZE"
  type: number
  sql: ${purchase_value_before_tax}/${orders_count} ;;
}
measure: last_day_purchase_value {
  label: "LAST_DAY_PURCHASE_VALUE"
  type: sum
  sql: ${TABLE}.LAST_DAY_PURCHASE_VALUE ;;
}

measure: current_year_mtd_value {
  label: "CURRENT_YEAR_MTD_VALUE"
  type: sum
  sql: ${TABLE}.CURRENT_YEAR_MTD_VALUE ;;
}

measure: last_year_mtd_value {
  label: "LAST_YEAR_MTD_VALUE"
  type: sum
  sql: ${TABLE}.LAST_YEAR_MTD_VALUE ;;
}

measure: current_year_ytd_value {
  label: "CURRENT_YEAR_YTD_VALUE"
  type: sum
  sql: ${TABLE}.CURRENT_YEAR_YTD_VALUE ;;
}

measure: last_year_ytd_value {
  label: "LAST_YEAR_YTD_VALUE"
  type: sum
  sql: ${TABLE}.LAST_YEAR_YTD_VALUE ;;
}
measure: count_customer {
  description: "for show visualize frequency"
  label: "COUNT_CUSTOMER"
  type: number
  sql: count(${customer_cd});;
  # html: <div class="vis">
  #     <div class="vis-single-value" style="line-height: 1;font-size: 17px; text-align:center;color:black;" >
  #     </div>
  #   </div> ;;
}
  measure: diff_date {
    label: "DIFF_DATE"
    type: max
    sql: ${TABLE}.DIFF_DATE ;;
  }

  # sales
  # frequency
  # avg bill size
  # abg basket size
  parameter: measure_selector {
    type: unquoted
    default_value: "revenue"
    allowed_value: {
      label: "Sales"
      value: "sales"
    }
    allowed_value: {
      label: "Frequency"
      value: "frequency"
    }
    allowed_value: {
      label: "AVG  Bill Size"
      value: "avgBillSize"
    }
    allowed_value: {
      label: "AVG Basket Size"
      value: "avgBasketSize"
    }
  }

  measure: dynamic_measure {
    label_from_parameter: measure_selector
    type: number
    sql:
      {% if measure_selector._parameter_value == "sales" %} ${purchase_value_before_tax}
      {% elsif measure_selector._parameter_value == "frequency" %} ${count_customer}
      {% elsif measure_selector._parameter_value == "avgBillSize" %} ${bill_size}
      {% else %} ${basket_size}
      {% endif %};;
    html:
      {% if measure_selector._parameter_value == "sales" %} {{ purchase_value_before_tax._rendered_value }}
      {% elsif measure_selector._parameter_value == "frequency" %} {{count_customer._rendered_value}}
      {% elsif measure_selector._parameter_value == "avgBillSize" %} {{bill_size._rendered_value}}
      {% else %} {{ basket_size._rendered_value }}
      {% endif %} ;;
  }
  # measure: dynamic_measure {
  #   label_from_parameter: measure_selector
  #   type: number
  #   sql:
  #     {% if measure_selector._parameter_value == "count" %} ${count}
  #     {% else %} ${total_sale_price}
  #     {% endif %};;
  #   html:
  #     {% if measure_selector._parameter_value == "revenue" %} {{ total_sale_price._rendered_value }}
  #     {% else %} {{ count._rendered_value }}
  #     {% endif %} ;;
  # }
  parameter: line_chart_parameter {
    type: unquoted
    description: "To be used with the Line chart value field"
    allowed_value: {label:"Total of Sales" value: "Sales"}
    allowed_value: {label: "Total of Frequency" value: "Frequency"}
    allowed_value: {label: "Average of bill size" value: "AVG_ Bill_Size"}
    allowed_value: {label: "Average of basket size" value: "AVG_Basket_Size"}
  }
  measure: line_chart_value {
    type: number
    description: "To be used with line chart parameter field"
    sql:  {% if line_chart_parameter.parameter_value == "Sales"%}
          ${purchase_value_before_tax}
          {%elsif line_chart_parameter.parameter_value == "Frequency"%}
          ${count_customer}
          {%elsif line_chart_parameter.parameter_value == "AVG_Bill_Size"%}
          ${bill_size}
          {% else %}
          ${basket_size}
          {% endif %} ;;
  }
 }
