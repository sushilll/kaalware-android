.class public Lcom/kaal/ware/PermissionManager;
.super Ljava/lang/Object;
.source "PermissionManager.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canIUse(Ljava/lang/String;)Z
    .registers 3
    .param p0, "perm"    # Ljava/lang/String;

    .line 28
    sget-object v0, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    return v0

    .line 29
    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method public static getGrantedPermissions()Lorg/json/JSONObject;
    .registers 5

    .line 14
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .local v0, "data":Lorg/json/JSONObject;
    :try_start_5
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 17
    .local v1, "perms":Lorg/json/JSONArray;
    sget-object v2, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    sget-object v3, Lcom/kaal/ware/ConnectionManager;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1000

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 18
    .local v2, "pi":Landroid/content/pm/PackageInfo;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_34

    .line 19
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->requestedPermissionsFlags:[I

    aget v4, v4, v3

    and-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_31

    iget-object v4, v2, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 18
    :cond_31
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 21
    .end local v3    # "i":I
    :cond_34
    const-string v3, "permissions"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_39} :catch_3b

    .line 23
    nop

    .end local v1    # "perms":Lorg/json/JSONArray;
    .end local v2    # "pi":Landroid/content/pm/PackageInfo;
    goto :goto_3c

    .line 22
    :catch_3b
    move-exception v1

    .line 24
    :goto_3c
    return-object v0
.end method
