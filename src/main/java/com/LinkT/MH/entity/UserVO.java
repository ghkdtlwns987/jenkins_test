package com.LinkT.MH.entity;
import lombok.*;

/*
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
*/
@Getter
@Setter
public class UserVO {
    private String id;
    private String pw;
    private String name;
}