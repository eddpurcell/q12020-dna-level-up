BEGIN {
	FS = ","
	# kilometers
	# R = 6371
	# miles
	R = 3959
}

FNR > 1 {
	print manhattan_haversine($6, $7, $10, $11) / ($1 / 3600)
}

function to_rad(n) {
	return n * atan2(0, -1) / 180
}

function manhattan_haversine(lat1, lon1, lat2, lon2) {
	phi1 = to_rad($6)
	phi2 = to_rad($10)
	d_lat = to_rad($10-$6)
	d_lon = to_rad($11-$7)
	# lat only change
	a1 = sin(d_lat/2) * sin(d_lat/2)
	c1 = 2 * atan2(sqrt(a1), sqrt(1-a1))
	# lon only change
	a2 = cos(phi2) * cos(phi2) * sin(d_lon/2) * sin(d_lon/2)
	c2 = 2 * atan2(sqrt(a2), sqrt(1-a2))
	d = R * (c1 + c2)
	return d
}

# 0.1278
# 0.6787
# 0.8065
# 0.6906

function haversine(lat1, lon1, lat2, lon2) {
	phi1 = to_rad($6)
	phi2 = to_rad($10)
	d_lat = to_rad($10-$6)
	d_lon = to_rad($11-$7)
	a = sin(d_lat/2) * sin(d_lat/2) + cos(phi1) * cos(phi2) * sin(d_lon/2) * sin(d_lon/2)
	c = 2 * atan2(sqrt(a), sqrt(1-a))
	d = R * c
	return d
}
