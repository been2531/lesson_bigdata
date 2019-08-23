import tensorflow as tf
# import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import sys


tf.app.flags.DEFINE_string("output_graph",
                           "flowers_graph.pb",
                           "학습된 신경망이 저장된 위치")
tf.app.flags.DEFINE_string("output_labels",
                           "Red_Velvet_labels.txt",
                           "학습할 레이블 데이터 파일")
tf.app.flags.DEFINE_boolean("show_image",
                            True,
                            "이미지 추론 후 이미지를 보여줍니다.")

FLAGS = tf.app.flags.FLAGS


def main(_):
    labels = [line.rstrip() for line in tf.gfile.GFile(FLAGS.output_labels)]

    with tf.gfile.FastGFile(FLAGS.output_graph, 'rb') as fp:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(fp.read())
        tf.import_graph_def(graph_def, name='')

    with tf.Session() as sess:
        logits = sess.graph.get_tensor_by_name('final_result:0')
        # sys.argv[1] = 'D:\\workspace\\flower_photos\\sunflowers\\310380634_60e6c79989.jpg'
        # 레드벨벳 사진
        image = tf.gfile.FastGFile('C:\\Users\\CPB06GameN\\PycharmProjects\\test01\\tensorflow\\workspace_flowers_windows_pycharm\\Red_Velvet\\IRENE\\이선빈.jpg', 'rb').read()
        # 꽃 사진
        # image = tf.gfile.FastGFile('C:\\Users\\CPB06GameN\\PycharmProjects\\test01\\tensorflow\\workspace_flowers_windows_pycharm\\flower_photos\\sunflowers\\8285.jpeg', 'rb').read()
        prediction = sess.run(logits, {'DecodeJpeg/contents:0': image})

    # print('=== 예측 결과 ===')
    # top_result = int(np.argmax(prediction[0]))
    # name = labels[top_result]
    # score = prediction[0][top_result]
    # print('%s (%.2f%%)' % (name, score * 100))

    print('=== 예측 결과 ===')
    for i in range(len(labels)):
        name = labels[i]
        score = prediction[0][i]
        print('%s (%.2f%%)' % (name, score * 100))

    if FLAGS.show_image:
        # sys.argv[1] = 'D:\\workspace\\flower_photos\\sunflowers\\310380634_60e6c79989.jpg'
        # img = mpimg.imread('C:\\Users\\storm\\PycharmProjects\\tensorflow\\workspace_flowers_windows_pycharm\\flower_photos\\sunflowers\\310380634_60e6c79989.jpg')
        img = mpimg.imread('C:\\Users\\CPB06GameN\\PycharmProjects\\test01\\tensorflow\\workspace_flowers_windows_pycharm\\Red_Velvet\\IRENE\\이선빈.jpg')
        # img = mpimg.imread('C:\\Users\\CPB06GameN\\PycharmProjects\\test01\\tensorflow\\workspace_flowers_windows_pycharm\\flower_photos\\sunflowers\\8283.jpg')

        plt.imshow(img)
        plt.show()


if __name__ == "__main__":
    tf.app.run()
