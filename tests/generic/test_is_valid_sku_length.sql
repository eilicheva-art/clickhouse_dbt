{% test is_valid_sku_length(model, column_name, required_length=32) %}
    {# 
        Custom generic тест на проверку количества символов в строке в ячейках столбца.
        Возвращает строки, где длина строки не равна required_length.
    #}
    SELECT
        *
    FROM {{ model }}
    WHERE length({{ column_name }}) != {{ required_length }}

{% endtest %}