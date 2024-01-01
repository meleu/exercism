local Hamming = {}

function Hamming.compute(a, b)
	if #a ~= #b then
		return -1
	end

	if a == b then
		return 0
	end

	local distance = 0

	for i = 1, #a do
		local letter_a = string.sub(a, i, i)
		local letter_b = string.sub(b, i, i)
		if letter_a ~= letter_b then
			distance = distance + 1
		end
	end

	return distance
end

return Hamming
