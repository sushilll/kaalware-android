.class Lio/socket/engineio/parser/Buffer;
.super Ljava/lang/Object;
.source "Parser.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static concat([[B)[B
    .registers 6
    .param p0, "list"    # [[B

    .line 295
    const/4 v0, 0x0

    .line 296
    .local v0, "length":I
    array-length v1, p0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v1, :cond_c

    aget-object v3, p0, v2

    .line 297
    .local v3, "buf":[B
    array-length v4, v3

    add-int/2addr v0, v4

    .line 296
    .end local v3    # "buf":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 299
    :cond_c
    invoke-static {p0, v0}, Lio/socket/engineio/parser/Buffer;->concat([[BI)[B

    move-result-object v1

    return-object v1
.end method

.method public static concat([[BI)[B
    .registers 6
    .param p0, "list"    # [[B
    .param p1, "length"    # I

    .line 303
    array-length v0, p0

    const/4 v1, 0x0

    if-nez v0, :cond_7

    .line 304
    new-array v0, v1, [B

    return-object v0

    .line 305
    :cond_7
    array-length v0, p0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_e

    .line 306
    aget-object v0, p0, v1

    return-object v0

    .line 309
    :cond_e
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 310
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    array-length v2, p0

    :goto_13
    if-ge v1, v2, :cond_1d

    aget-object v3, p0, v1

    .line 311
    .local v3, "buf":[B
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 310
    .end local v3    # "buf":[B
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 314
    :cond_1d
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method
