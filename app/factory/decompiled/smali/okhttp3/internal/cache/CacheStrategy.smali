.class public final Lokhttp3/internal/cache/CacheStrategy;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/cache/CacheStrategy$Factory;
    }
.end annotation


# instance fields
.field public final cacheResponse:Lokhttp3/Response;

.field public final networkRequest:Lokhttp3/Request;


# direct methods
.method constructor <init>(Lokhttp3/Request;Lokhttp3/Response;)V
    .registers 3
    .param p1, "networkRequest"    # Lokhttp3/Request;
    .param p2, "cacheResponse"    # Lokhttp3/Response;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lokhttp3/internal/cache/CacheStrategy;->networkRequest:Lokhttp3/Request;

    .line 58
    iput-object p2, p0, Lokhttp3/internal/cache/CacheStrategy;->cacheResponse:Lokhttp3/Response;

    .line 59
    return-void
.end method

.method public static isCacheable(Lokhttp3/Response;Lokhttp3/Request;)Z
    .registers 5
    .param p0, "response"    # Lokhttp3/Response;
    .param p1, "request"    # Lokhttp3/Request;

    .line 65
    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0xc8

    const/4 v2, 0x0

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x19a

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x19e

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x1f5

    if-eq v0, v1, :cond_5a

    const/16 v1, 0xcb

    if-eq v0, v1, :cond_5a

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x133

    if-eq v0, v1, :cond_31

    const/16 v1, 0x134

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x194

    if-eq v0, v1, :cond_5a

    const/16 v1, 0x195

    if-eq v0, v1, :cond_5a

    packed-switch v0, :pswitch_data_72

    goto :goto_59

    .line 85
    :cond_31
    :pswitch_31
    const-string v0, "Expires"

    invoke-virtual {p0, v0}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5b

    .line 86
    invoke-virtual {p0}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_5b

    .line 87
    invoke-virtual {p0}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->isPublic()Z

    move-result v0

    if-nez v0, :cond_5b

    .line 88
    invoke-virtual {p0}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->isPrivate()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 89
    goto :goto_5b

    .line 95
    :cond_59
    :goto_59
    return v2

    .line 78
    :cond_5a
    :pswitch_5a
    nop

    .line 99
    :cond_5b
    :goto_5b
    invoke-virtual {p0}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->noStore()Z

    move-result v0

    if-nez v0, :cond_70

    invoke-virtual {p1}, Lokhttp3/Request;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->noStore()Z

    move-result v0

    if-nez v0, :cond_70

    const/4 v2, 0x1

    :cond_70
    return v2

    nop

    :pswitch_data_72
    .packed-switch 0x12c
        :pswitch_5a
        :pswitch_5a
        :pswitch_31
    .end packed-switch
.end method
