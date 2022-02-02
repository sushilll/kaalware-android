.class public final Lokio/InflaterSource;
.super Ljava/lang/Object;
.source "InflaterSource.java"

# interfaces
.implements Lokio/Source;


# instance fields
.field private bufferBytesHeldByInflater:I

.field private closed:Z

.field private final inflater:Ljava/util/zip/Inflater;

.field private final source:Lokio/BufferedSource;


# direct methods
.method constructor <init>(Lokio/BufferedSource;Ljava/util/zip/Inflater;)V
    .registers 5
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "inflater"    # Ljava/util/zip/Inflater;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    if-eqz p1, :cond_14

    .line 50
    if-eqz p2, :cond_c

    .line 51
    iput-object p1, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    .line 52
    iput-object p2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    .line 53
    return-void

    .line 50
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "inflater == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lokio/Source;Ljava/util/zip/Inflater;)V
    .registers 4
    .param p1, "source"    # Lokio/Source;
    .param p2, "inflater"    # Ljava/util/zip/Inflater;

    .line 40
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lokio/InflaterSource;-><init>(Lokio/BufferedSource;Ljava/util/zip/Inflater;)V

    .line 41
    return-void
.end method

.method private releaseInflatedBytes()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    iget v0, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    if-nez v0, :cond_5

    return-void

    .line 113
    :cond_5
    iget-object v1, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v1

    sub-int/2addr v0, v1

    .line 114
    .local v0, "toRelease":I
    iget v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    sub-int/2addr v1, v0

    iput v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 115
    iget-object v1, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    int-to-long v2, v0

    invoke-interface {v1, v2, v3}, Lokio/BufferedSource;->skip(J)V

    .line 116
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    iget-boolean v0, p0, Lokio/InflaterSource;->closed:Z

    if-eqz v0, :cond_5

    return-void

    .line 124
    :cond_5
    iget-object v0, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokio/InflaterSource;->closed:Z

    .line 126
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->close()V

    .line 127
    return-void
.end method

.method public read(Lokio/Buffer;J)J
    .registers 11
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_76

    .line 58
    iget-boolean v2, p0, Lokio/InflaterSource;->closed:Z

    if-nez v2, :cond_6e

    .line 59
    cmp-long v2, p2, v0

    if-nez v2, :cond_f

    return-wide v0

    .line 62
    :cond_f
    :goto_f
    invoke-virtual {p0}, Lokio/InflaterSource;->refill()Z

    move-result v0

    .line 66
    .local v0, "sourceExhausted":Z
    const/4 v1, 0x1

    :try_start_14
    invoke-virtual {p1, v1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v1

    .line 67
    .local v1, "tail":Lokio/Segment;
    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v3, v1, Lokio/Segment;->data:[B

    iget v4, v1, Lokio/Segment;->limit:I

    iget v5, v1, Lokio/Segment;->limit:I

    rsub-int v5, v5, 0x2000

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v2

    .line 68
    .local v2, "bytesInflated":I
    if-lez v2, :cond_35

    .line 69
    iget v3, v1, Lokio/Segment;->limit:I

    add-int/2addr v3, v2

    iput v3, v1, Lokio/Segment;->limit:I

    .line 70
    iget-wide v3, p1, Lokio/Buffer;->size:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p1, Lokio/Buffer;->size:J

    .line 71
    int-to-long v3, v2

    return-wide v3

    .line 73
    :cond_35
    iget-object v3, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->finished()Z

    move-result v3

    if-nez v3, :cond_52

    iget-object v3, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v3

    if-eqz v3, :cond_46

    goto :goto_52

    .line 82
    :cond_46
    if-nez v0, :cond_4a

    .line 85
    .end local v1    # "tail":Lokio/Segment;
    .end local v2    # "bytesInflated":I
    nop

    .line 86
    .end local v0    # "sourceExhausted":Z
    goto :goto_f

    .line 82
    .restart local v0    # "sourceExhausted":Z
    .restart local v1    # "tail":Lokio/Segment;
    .restart local v2    # "bytesInflated":I
    :cond_4a
    new-instance v3, Ljava/io/EOFException;

    const-string v4, "source exhausted prematurely"

    invoke-direct {v3, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .end local v0    # "sourceExhausted":Z
    .end local p1    # "sink":Lokio/Buffer;
    .end local p2    # "byteCount":J
    throw v3

    .line 74
    .restart local v0    # "sourceExhausted":Z
    .restart local p1    # "sink":Lokio/Buffer;
    .restart local p2    # "byteCount":J
    :cond_52
    :goto_52
    invoke-direct {p0}, Lokio/InflaterSource;->releaseInflatedBytes()V

    .line 75
    iget v3, v1, Lokio/Segment;->pos:I

    iget v4, v1, Lokio/Segment;->limit:I

    if-ne v3, v4, :cond_64

    .line 77
    invoke-virtual {v1}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v3

    iput-object v3, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 78
    invoke-static {v1}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V
    :try_end_64
    .catch Ljava/util/zip/DataFormatException; {:try_start_14 .. :try_end_64} :catch_67

    .line 80
    :cond_64
    const-wide/16 v3, -0x1

    return-wide v3

    .line 83
    .end local v1    # "tail":Lokio/Segment;
    .end local v2    # "bytesInflated":I
    :catch_67
    move-exception v1

    .line 84
    .local v1, "e":Ljava/util/zip/DataFormatException;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 58
    .end local v0    # "sourceExhausted":Z
    .end local v1    # "e":Ljava/util/zip/DataFormatException;
    :cond_6e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_8e

    :goto_8d
    throw v0

    :goto_8e
    goto :goto_8d
.end method

.method public refill()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 97
    :cond_a
    invoke-direct {p0}, Lokio/InflaterSource;->releaseInflatedBytes()V

    .line 98
    iget-object v0, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v0

    if-nez v0, :cond_3a

    .line 101
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_1f

    const/4 v0, 0x1

    return v0

    .line 104
    :cond_1f
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->buffer()Lokio/Buffer;

    move-result-object v0

    iget-object v0, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 105
    .local v0, "head":Lokio/Segment;
    iget v2, v0, Lokio/Segment;->limit:I

    iget v3, v0, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    iput v2, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 106
    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v3, v0, Lokio/Segment;->data:[B

    iget v4, v0, Lokio/Segment;->pos:I

    iget v5, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 107
    return v1

    .line 98
    .end local v0    # "head":Lokio/Segment;
    :cond_3a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .line 119
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
