json.array!(@sales) do |sale|
  json.extract! sale, :sale_ts, :code, :value
end
