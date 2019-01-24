json.component_type component.component_type
json.variation component.variation
json.conditions component.conditions, partial: "condition", as: :condition

json.attributes component.attributes do |attribute|
  json.json attribute.json
end
