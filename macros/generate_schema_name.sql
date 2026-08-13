{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if custom_schema_name is not none -%}
        
        {# Если схема указана у модели, используем только её #}
        {{ custom_schema_name }}
        
    {%- else -%}
    
        {# Если не указана — берем в дефолтную схему из profiles.yml #}
        {{ target.schema }}
        
    {%- endif -%}

{%- endmacro %}