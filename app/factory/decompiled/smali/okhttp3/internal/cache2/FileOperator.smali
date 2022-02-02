.class final Lokhttp3/internal/cache2/FileOperator;
.super Ljava/lang/Object;
.source "FileOperator.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# instance fields
.field private final byteArray:[B

.field private final byteBuffer:Ljava/nio/ByteBuffer;

.field private final fileChannel:Ljava/nio/channels/FileChannel;


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;)V
    .registers 3
    .param p1, "fileChannel"    # Ljava/nio/channels/FileChannel;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    .line 41
    iget-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 45
    iput-object p1, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 46
    return-void
.end method


# virtual methods
.method public read(JLokio/Buffer;J)V
    .registers 11
    .param p1, "pos"    # J
    .param p3, "sink"    # Lokio/Buffer;
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_46

    .line 80
    :goto_6
    cmp-long v2, p4, v0

    if-lez v2, :cond_45

    .line 83
    :try_start_a
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    const-wide/16 v3, 0x2000

    invoke-static {v3, v4, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 84
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3, p1, p2}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_38

    .line 85
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 88
    .local v2, "bytesRead":I
    iget-object v3, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    const/4 v4, 0x0

    invoke-virtual {p3, v3, v4, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;
    :try_end_2d
    .catchall {:try_start_a .. :try_end_2d} :catchall_3e

    .line 89
    int-to-long v3, v2

    add-long/2addr p1, v3

    .line 90
    int-to-long v3, v2

    sub-long/2addr p4, v3

    .line 92
    .end local v2    # "bytesRead":I
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 93
    nop

    .line 92
    goto :goto_6

    .line 84
    :cond_38
    :try_start_38
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .end local p1    # "pos":J
    .end local p3    # "sink":Lokio/Buffer;
    .end local p4    # "byteCount":J
    throw v0
    :try_end_3e
    .catchall {:try_start_38 .. :try_end_3e} :catchall_3e

    .line 92
    .restart local p1    # "pos":J
    .restart local p3    # "sink":Lokio/Buffer;
    .restart local p4    # "byteCount":J
    :catchall_3e
    move-exception v0

    iget-object v1, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    throw v0

    .line 95
    :cond_45
    return-void

    .line 78
    :cond_46
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_4d

    :goto_4c
    throw v0

    :goto_4d
    goto :goto_4c
.end method

.method public write(JLokio/Buffer;J)V
    .registers 12
    .param p1, "pos"    # J
    .param p3, "source"    # Lokio/Buffer;
    .param p4, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-ltz v2, :cond_47

    invoke-virtual {p3}, Lokio/Buffer;->size()J

    move-result-wide v2

    cmp-long v4, p4, v2

    if-gtz v4, :cond_47

    .line 52
    :goto_e
    cmp-long v2, p4, v0

    if-lez v2, :cond_46

    .line 55
    const-wide/16 v2, 0x2000

    :try_start_14
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v3, v2

    .line 56
    .local v3, "toWrite":I
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteArray:[B

    const/4 v4, 0x0

    invoke-virtual {p3, v2, v4, v3}, Lokio/Buffer;->read([BII)I

    .line 57
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 61
    :cond_24
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v4, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v4, p1, p2}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;J)I

    move-result v2

    .line 62
    .local v2, "bytesWritten":I
    int-to-long v4, v2

    add-long/2addr p1, v4

    .line 63
    .end local v2    # "bytesWritten":I
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2
    :try_end_34
    .catchall {:try_start_14 .. :try_end_34} :catchall_3f

    if-nez v2, :cond_24

    .line 65
    int-to-long v4, v3

    sub-long/2addr p4, v4

    .line 67
    .end local v3    # "toWrite":I
    iget-object v2, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 68
    nop

    .line 67
    goto :goto_e

    :catchall_3f
    move-exception v0

    iget-object v1, p0, Lokhttp3/internal/cache2/FileOperator;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    throw v0

    .line 70
    :cond_46
    return-void

    .line 50
    :cond_47
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_4e

    :goto_4d
    throw v0

    :goto_4e
    goto :goto_4d
.end method
