.class final Lokio/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final MAP:[B

.field private static final URL_MAP:[B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 110
    const/16 v0, 0x40

    new-array v1, v0, [B

    fill-array-data v1, :array_12

    sput-object v1, Lokio/Base64;->MAP:[B

    .line 117
    new-array v0, v0, [B

    fill-array-data v0, :array_36

    sput-object v0, Lokio/Base64;->URL_MAP:[B

    return-void

    nop

    :array_12
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_36
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .registers 15
    .param p0, "in"    # Ljava/lang/String;

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 32
    .local v0, "limit":I
    :goto_4
    const/16 v1, 0x9

    const/16 v2, 0x20

    const/16 v3, 0xd

    const/16 v4, 0xa

    if-lez v0, :cond_24

    .line 33
    add-int/lit8 v5, v0, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 34
    .local v5, "c":C
    const/16 v6, 0x3d

    if-eq v5, v6, :cond_21

    if-eq v5, v4, :cond_21

    if-eq v5, v3, :cond_21

    if-eq v5, v2, :cond_21

    if-eq v5, v1, :cond_21

    .line 35
    goto :goto_24

    .line 32
    .end local v5    # "c":C
    :cond_21
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 40
    :cond_24
    :goto_24
    int-to-long v5, v0

    const-wide/16 v7, 0x6

    mul-long v5, v5, v7

    const-wide/16 v7, 0x8

    div-long/2addr v5, v7

    long-to-int v6, v5

    new-array v5, v6, [B

    .line 41
    .local v5, "out":[B
    const/4 v6, 0x0

    .line 42
    .local v6, "outCount":I
    const/4 v7, 0x0

    .line 44
    .local v7, "inCount":I
    const/4 v8, 0x0

    .line 45
    .local v8, "word":I
    const/4 v9, 0x0

    .local v9, "pos":I
    :goto_33
    const/4 v10, 0x0

    if-ge v9, v0, :cond_9e

    .line 46
    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 49
    .local v11, "c":C
    const/16 v12, 0x41

    if-lt v11, v12, :cond_45

    const/16 v12, 0x5a

    if-gt v11, v12, :cond_45

    .line 53
    add-int/lit8 v10, v11, -0x41

    .local v10, "bits":I
    goto :goto_7c

    .line 54
    .end local v10    # "bits":I
    :cond_45
    const/16 v12, 0x61

    if-lt v11, v12, :cond_50

    const/16 v12, 0x7a

    if-gt v11, v12, :cond_50

    .line 58
    add-int/lit8 v10, v11, -0x47

    .restart local v10    # "bits":I
    goto :goto_7c

    .line 59
    .end local v10    # "bits":I
    :cond_50
    const/16 v12, 0x30

    if-lt v11, v12, :cond_5b

    const/16 v12, 0x39

    if-gt v11, v12, :cond_5b

    .line 63
    add-int/lit8 v10, v11, 0x4

    .restart local v10    # "bits":I
    goto :goto_7c

    .line 64
    .end local v10    # "bits":I
    :cond_5b
    const/16 v12, 0x2b

    if-eq v11, v12, :cond_7a

    const/16 v12, 0x2d

    if-ne v11, v12, :cond_64

    goto :goto_7a

    .line 66
    :cond_64
    const/16 v12, 0x2f

    if-eq v11, v12, :cond_77

    const/16 v12, 0x5f

    if-ne v11, v12, :cond_6d

    goto :goto_77

    .line 68
    :cond_6d
    if-eq v11, v4, :cond_9b

    if-eq v11, v3, :cond_9b

    if-eq v11, v2, :cond_9b

    if-ne v11, v1, :cond_76

    .line 69
    goto :goto_9b

    .line 71
    :cond_76
    return-object v10

    .line 67
    :cond_77
    :goto_77
    const/16 v10, 0x3f

    .restart local v10    # "bits":I
    goto :goto_7c

    .line 65
    .end local v10    # "bits":I
    :cond_7a
    :goto_7a
    const/16 v10, 0x3e

    .line 75
    .restart local v10    # "bits":I
    :goto_7c
    shl-int/lit8 v12, v8, 0x6

    int-to-byte v13, v10

    or-int v8, v12, v13

    .line 78
    add-int/lit8 v7, v7, 0x1

    .line 79
    rem-int/lit8 v12, v7, 0x4

    if-nez v12, :cond_9b

    .line 80
    add-int/lit8 v12, v6, 0x1

    .end local v6    # "outCount":I
    .local v12, "outCount":I
    shr-int/lit8 v13, v8, 0x10

    int-to-byte v13, v13

    aput-byte v13, v5, v6

    .line 81
    add-int/lit8 v6, v12, 0x1

    .end local v12    # "outCount":I
    .restart local v6    # "outCount":I
    shr-int/lit8 v13, v8, 0x8

    int-to-byte v13, v13

    aput-byte v13, v5, v12

    .line 82
    add-int/lit8 v12, v6, 0x1

    .end local v6    # "outCount":I
    .restart local v12    # "outCount":I
    int-to-byte v13, v8

    aput-byte v13, v5, v6

    move v6, v12

    .line 45
    .end local v10    # "bits":I
    .end local v11    # "c":C
    .end local v12    # "outCount":I
    .restart local v6    # "outCount":I
    :cond_9b
    :goto_9b
    add-int/lit8 v9, v9, 0x1

    goto :goto_33

    .line 86
    .end local v9    # "pos":I
    :cond_9e
    rem-int/lit8 v1, v7, 0x4

    .line 87
    .local v1, "lastWordChars":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_a4

    .line 89
    return-object v10

    .line 90
    :cond_a4
    const/4 v2, 0x2

    if-ne v1, v2, :cond_b2

    .line 92
    shl-int/lit8 v8, v8, 0xc

    .line 93
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "outCount":I
    .local v2, "outCount":I
    shr-int/lit8 v3, v8, 0x10

    int-to-byte v3, v3

    aput-byte v3, v5, v6

    move v6, v2

    goto :goto_c5

    .line 94
    .end local v2    # "outCount":I
    .restart local v6    # "outCount":I
    :cond_b2
    const/4 v2, 0x3

    if-ne v1, v2, :cond_c5

    .line 96
    shl-int/lit8 v8, v8, 0x6

    .line 97
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "outCount":I
    .restart local v2    # "outCount":I
    shr-int/lit8 v3, v8, 0x10

    int-to-byte v3, v3

    aput-byte v3, v5, v6

    .line 98
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "outCount":I
    .restart local v6    # "outCount":I
    shr-int/lit8 v3, v8, 0x8

    int-to-byte v3, v3

    aput-byte v3, v5, v2

    .line 102
    :cond_c5
    :goto_c5
    array-length v2, v5

    if-ne v6, v2, :cond_c9

    return-object v5

    .line 105
    :cond_c9
    new-array v2, v6, [B

    .line 106
    .local v2, "prefix":[B
    const/4 v3, 0x0

    invoke-static {v5, v3, v2, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    return-object v2
.end method

.method public static encode([B)Ljava/lang/String;
    .registers 2
    .param p0, "in"    # [B

    .line 125
    sget-object v0, Lokio/Base64;->MAP:[B

    invoke-static {p0, v0}, Lokio/Base64;->encode([B[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encode([B[B)Ljava/lang/String;
    .registers 11
    .param p0, "in"    # [B
    .param p1, "map"    # [B

    .line 133
    array-length v0, p0

    const/4 v1, 0x2

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x4

    .line 134
    .local v0, "length":I
    new-array v2, v0, [B

    .line 135
    .local v2, "out":[B
    const/4 v3, 0x0

    .local v3, "index":I
    array-length v4, p0

    array-length v5, p0

    rem-int/lit8 v5, v5, 0x3

    sub-int/2addr v4, v5

    .line 136
    .local v4, "end":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_10
    if-ge v5, v4, :cond_57

    .line 137
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "index":I
    .local v6, "index":I
    aget-byte v7, p0, v5

    and-int/lit16 v7, v7, 0xff

    shr-int/2addr v7, v1

    aget-byte v7, p1, v7

    aput-byte v7, v2, v3

    .line 138
    add-int/lit8 v3, v6, 0x1

    .end local v6    # "index":I
    .restart local v3    # "index":I
    aget-byte v7, p0, v5

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v5, 0x1

    aget-byte v8, p0, v8

    and-int/lit16 v8, v8, 0xff

    shr-int/lit8 v8, v8, 0x4

    or-int/2addr v7, v8

    aget-byte v7, p1, v7

    aput-byte v7, v2, v6

    .line 139
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "index":I
    .restart local v6    # "index":I
    add-int/lit8 v7, v5, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/2addr v7, v1

    add-int/lit8 v8, v5, 0x2

    aget-byte v8, p0, v8

    and-int/lit16 v8, v8, 0xff

    shr-int/lit8 v8, v8, 0x6

    or-int/2addr v7, v8

    aget-byte v7, p1, v7

    aput-byte v7, v2, v3

    .line 140
    add-int/lit8 v3, v6, 0x1

    .end local v6    # "index":I
    .restart local v3    # "index":I
    add-int/lit8 v7, v5, 0x2

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0x3f

    aget-byte v7, p1, v7

    aput-byte v7, v2, v6

    .line 136
    add-int/lit8 v5, v5, 0x3

    goto :goto_10

    .line 142
    .end local v5    # "i":I
    :cond_57
    array-length v5, p0

    rem-int/lit8 v5, v5, 0x3

    const/16 v6, 0x3d

    const/4 v7, 0x1

    if-eq v5, v7, :cond_95

    if-eq v5, v1, :cond_62

    goto :goto_b6

    .line 150
    :cond_62
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "index":I
    .local v5, "index":I
    aget-byte v7, p0, v4

    and-int/lit16 v7, v7, 0xff

    shr-int/2addr v7, v1

    aget-byte v7, p1, v7

    aput-byte v7, v2, v3

    .line 151
    add-int/lit8 v3, v5, 0x1

    .end local v5    # "index":I
    .restart local v3    # "index":I
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v4, 0x1

    aget-byte v8, p0, v8

    and-int/lit16 v8, v8, 0xff

    shr-int/lit8 v8, v8, 0x4

    or-int/2addr v7, v8

    aget-byte v7, p1, v7

    aput-byte v7, v2, v5

    .line 152
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "index":I
    .restart local v5    # "index":I
    add-int/lit8 v7, v4, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v1, v7, 0x2

    aget-byte v1, p1, v1

    aput-byte v1, v2, v3

    .line 153
    add-int/lit8 v3, v5, 0x1

    .end local v5    # "index":I
    .restart local v3    # "index":I
    aput-byte v6, v2, v5

    goto :goto_b6

    .line 144
    :cond_95
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "index":I
    .restart local v5    # "index":I
    aget-byte v7, p0, v4

    and-int/lit16 v7, v7, 0xff

    shr-int/lit8 v1, v7, 0x2

    aget-byte v1, p1, v1

    aput-byte v1, v2, v3

    .line 145
    add-int/lit8 v1, v5, 0x1

    .end local v5    # "index":I
    .local v1, "index":I
    aget-byte v3, p0, v4

    and-int/lit8 v3, v3, 0x3

    shl-int/lit8 v3, v3, 0x4

    aget-byte v3, p1, v3

    aput-byte v3, v2, v5

    .line 146
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "index":I
    .restart local v3    # "index":I
    aput-byte v6, v2, v1

    .line 147
    add-int/lit8 v1, v3, 0x1

    .end local v3    # "index":I
    .restart local v1    # "index":I
    aput-byte v6, v2, v3

    .line 148
    move v3, v1

    .line 157
    .end local v1    # "index":I
    .restart local v3    # "index":I
    :goto_b6
    :try_start_b6
    new-instance v1, Ljava/lang/String;

    const-string v5, "US-ASCII"

    invoke-direct {v1, v2, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_bd
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b6 .. :try_end_bd} :catch_be

    return-object v1

    .line 158
    :catch_be
    move-exception v1

    .line 159
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    goto :goto_c6

    :goto_c5
    throw v5

    :goto_c6
    goto :goto_c5
.end method

.method public static encodeUrl([B)Ljava/lang/String;
    .registers 2
    .param p0, "in"    # [B

    .line 129
    sget-object v0, Lokio/Base64;->URL_MAP:[B

    invoke-static {p0, v0}, Lokio/Base64;->encode([B[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
