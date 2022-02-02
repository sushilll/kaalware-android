.class public Lio/socket/parser/Parser$Decoder;
.super Lio/socket/emitter/Emitter;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Decoder"
.end annotation


# static fields
.field public static EVENT_DECODED:Ljava/lang/String;


# instance fields
.field reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 140
    const-string v0, "decoded"

    sput-object v0, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 144
    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 146
    return-void
.end method

.method private static decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;
    .registers 10
    .param p0, "str"    # Ljava/lang/String;

    .line 174
    new-instance v0, Lio/socket/parser/Packet;

    invoke-direct {v0}, Lio/socket/parser/Packet;-><init>()V

    .line 175
    .local v0, "p":Lio/socket/parser/Packet;, "Lio/socket/parser/Packet<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 176
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 178
    .local v2, "length":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v4

    iput v4, v0, Lio/socket/parser/Packet;->type:I

    .line 179
    iget v4, v0, Lio/socket/parser/Packet;->type:I

    if-ltz v4, :cond_115

    iget v4, v0, Lio/socket/parser/Packet;->type:I

    sget-object v5, Lio/socket/parser/Parser;->types:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-le v4, v5, :cond_24

    goto/16 :goto_115

    .line 181
    :cond_24
    const/4 v4, 0x5

    iget v5, v0, Lio/socket/parser/Packet;->type:I

    if-eq v4, v5, :cond_2e

    const/4 v4, 0x6

    iget v5, v0, Lio/socket/parser/Packet;->type:I

    if-ne v4, v5, :cond_5c

    .line 182
    :cond_2e
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_110

    add-int/lit8 v4, v1, 0x1

    if-gt v2, v4, :cond_3c

    goto/16 :goto_110

    .line 183
    :cond_3c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .local v4, "attachments":Ljava/lang/StringBuilder;
    :goto_41
    add-int/2addr v1, v6

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x2d

    if-eq v5, v7, :cond_52

    .line 185
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_41

    .line 187
    :cond_52
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lio/socket/parser/Packet;->attachments:I

    .line 190
    .end local v4    # "attachments":Ljava/lang/StringBuilder;
    :cond_5c
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_88

    const/16 v4, 0x2f

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_88

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .local v4, "nsp":Ljava/lang/StringBuilder;
    :goto_6f
    add-int/2addr v1, v6

    .line 194
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 195
    .local v5, "c":C
    const/16 v7, 0x2c

    if-ne v7, v5, :cond_79

    goto :goto_80

    .line 196
    :cond_79
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v2, :cond_87

    .line 199
    .end local v5    # "c":C
    :goto_80
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 200
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    goto :goto_8c

    .line 198
    .restart local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_87
    goto :goto_6f

    .line 201
    .end local v4    # "nsp":Ljava/lang/StringBuilder;
    :cond_88
    const-string v4, "/"

    iput-object v4, v0, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    .line 204
    :goto_8c
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_d1

    .line 205
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    .line 206
    .local v4, "next":Ljava/lang/Character;
    invoke-virtual {v4}, Ljava/lang/Character;->charValue()C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v5

    const/4 v7, -0x1

    if-le v5, v7, :cond_d1

    .line 207
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .local v5, "id":Ljava/lang/StringBuilder;
    :goto_aa
    add-int/2addr v1, v6

    .line 210
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 211
    .local v7, "c":C
    invoke-static {v7}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v8

    if-gez v8, :cond_b8

    .line 212
    add-int/lit8 v1, v1, -0x1

    .line 213
    goto :goto_bf

    .line 215
    :cond_b8
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 216
    add-int/lit8 v8, v1, 0x1

    if-ne v8, v2, :cond_d0

    .line 219
    .end local v7    # "c":C
    :goto_bf
    :try_start_bf
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v0, Lio/socket/parser/Packet;->id:I
    :try_end_c9
    .catch Ljava/lang/NumberFormatException; {:try_start_bf .. :try_end_c9} :catch_ca

    .line 222
    goto :goto_d1

    .line 220
    :catch_ca
    move-exception v3

    .line 221
    .local v3, "e":Ljava/lang/NumberFormatException;
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v6

    return-object v6

    .line 217
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_d0
    goto :goto_aa

    .line 226
    .end local v4    # "next":Ljava/lang/Character;
    .end local v5    # "id":Ljava/lang/StringBuilder;
    :cond_d1
    :goto_d1
    add-int/lit8 v4, v1, 0x1

    if-le v2, v4, :cond_fb

    .line 228
    add-int/lit8 v1, v1, 0x1

    :try_start_d7
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 229
    new-instance v4, Lorg/json/JSONTokener;

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v0, Lio/socket/parser/Packet;->data:Ljava/lang/Object;
    :try_end_e9
    .catch Lorg/json/JSONException; {:try_start_d7 .. :try_end_e9} :catch_ea

    .line 233
    goto :goto_fb

    .line 230
    :catch_ea
    move-exception v3

    .line 231
    .local v3, "e":Lorg/json/JSONException;
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v6, "An error occured while retrieving data from JSONTokener"

    invoke-virtual {v4, v5, v6, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v4

    return-object v4

    .line 236
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_fb
    :goto_fb
    invoke-static {}, Lio/socket/parser/Parser;->access$000()Ljava/util/logging/Logger;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v3

    aput-object v0, v5, v6

    const-string v3, "decoded %s as %s"

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 237
    return-object v0

    .line 182
    :cond_110
    :goto_110
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v3

    return-object v3

    .line 179
    :cond_115
    :goto_115
    invoke-static {}, Lio/socket/parser/Parser;->access$100()Lio/socket/parser/Packet;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 7
    .param p1, "obj"    # Ljava/lang/String;

    .line 149
    invoke-static {p1}, Lio/socket/parser/Parser$Decoder;->decodeString(Ljava/lang/String;)Lio/socket/parser/Packet;

    move-result-object v0

    .line 150
    .local v0, "packet":Lio/socket/parser/Packet;
    iget v1, v0, Lio/socket/parser/Packet;->type:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x5

    if-eq v4, v1, :cond_1b

    const/4 v1, 0x6

    iget v4, v0, Lio/socket/parser/Packet;->type:I

    if-ne v1, v4, :cond_11

    goto :goto_1b

    .line 157
    :cond_11
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p0, v1, v3}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_33

    .line 151
    :cond_1b
    :goto_1b
    new-instance v1, Lio/socket/parser/Parser$BinaryReconstructor;

    invoke-direct {v1, v0}, Lio/socket/parser/Parser$BinaryReconstructor;-><init>(Lio/socket/parser/Packet;)V

    iput-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 153
    iget-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    iget-object v1, v1, Lio/socket/parser/Parser$BinaryReconstructor;->reconPack:Lio/socket/parser/Packet;

    iget v1, v1, Lio/socket/parser/Packet;->attachments:I

    if-nez v1, :cond_33

    .line 154
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p0, v1, v3}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 159
    :cond_33
    :goto_33
    return-void
.end method

.method public add([B)V
    .registers 6
    .param p1, "obj"    # [B

    .line 162
    iget-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    if-eqz v0, :cond_19

    .line 165
    invoke-virtual {v0, p1}, Lio/socket/parser/Parser$BinaryReconstructor;->takeBinaryData([B)Lio/socket/parser/Packet;

    move-result-object v0

    .line 166
    .local v0, "packet":Lio/socket/parser/Packet;
    if-eqz v0, :cond_18

    .line 167
    const/4 v1, 0x0

    iput-object v1, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    .line 168
    sget-object v1, Lio/socket/parser/Parser$Decoder;->EVENT_DECODED:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Lio/socket/parser/Parser$Decoder;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    .line 171
    .end local v0    # "packet":Lio/socket/parser/Packet;
    :cond_18
    return-void

    .line 163
    :cond_19
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "got binary data when not reconstructing a packet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public destroy()V
    .registers 2

    .line 241
    iget-object v0, p0, Lio/socket/parser/Parser$Decoder;->reconstructor:Lio/socket/parser/Parser$BinaryReconstructor;

    if-eqz v0, :cond_7

    .line 242
    invoke-virtual {v0}, Lio/socket/parser/Parser$BinaryReconstructor;->finishReconstruction()V

    .line 244
    :cond_7
    return-void
.end method
