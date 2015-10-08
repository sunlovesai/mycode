function validateIDCard(card) { 
    var num = card.toUpperCase(); 
    var reg = /^(\d{6})(19|20)(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)$/; 
    return reg.test(num); 
}