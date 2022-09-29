import Foundation

// This function does the actual check. Change if you want to check other criteria
func APICheck(reply: ReplyJSON) throws -> Bool {
	if reply.Name != "Badges" { return false }
	if !reply.CanRelist { return false }
	
	guard let promo = reply.Promotions.first(where: { PromoJSON in
		return PromoJSON.Name == "Feature"
	}) else {
		return false
	}
	
	return promo.Description == "Better position in category"
}
/*
Name = "Badges"
CanRelist = true
The Promotions element with Name = "Feature" has a Description that contains the text "Better position in category"
*/
