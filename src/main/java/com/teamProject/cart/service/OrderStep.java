package com.teamProject.cart.service;

public enum OrderStep {
    orderReceive(" ֹ     "),
    payReceive(" Ա Ȯ  "),
    shippingPrepare("    غ   "),
    shippingDelay("  ۴  "),
    shippingProgeress("     "),
    shippingComplete("  ۿϷ "),
    orderCancel(" ֹ    "),
    exchangeRequest("  ȯ  û"),
    exchangeComplete("  ȯ Ϸ "),
    refundRequest("ȯ ҿ û"),
    refundComplete("ȯ ҿϷ "),
    orderFail(" ֹ     ");

    private final String step;

    OrderStep(String step) {
        this.step = step;
    }

    public String getStep() {
        return step;
    }
}
