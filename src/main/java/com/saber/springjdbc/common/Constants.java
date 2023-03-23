package com.saber.springjdbc.common;

public class Constants {

    public enum StatusCode {
        ACTIVE((byte)1,"active"),
        DE_ACTIVE((byte)2,"deActive");
        private final byte value;
        private final String title;

        StatusCode(byte value, String title) {
            this.value = value;
            this.title = title;
        }

        public byte getValue() {
            return value;
        }

        public String getTitle() {
            return title;
        }
    }
}
