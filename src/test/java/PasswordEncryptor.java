import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;

public class PasswordEncryptor {

    public static void main(String[] args) {
        // 1. 建立加密器
        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
        
        // 2. 設定解密金鑰 (這就是你啟動時要傳入的 jasypt.encryptor.password)
        config.setPassword("my-secret-salt-key"); 
        
        // 3. 設定演算法 (Jasypt 3.x 預設為 PBEWITHHMACSHA512ANDAES_256)
        config.setAlgorithm("PBEWITHHMACSHA512ANDAES_256");
        config.setKeyObtentionIterations("1000");
        config.setPoolSize("1");
        config.setProviderName("SunJCE");
        config.setSaltGeneratorClassName("org.jasypt.salt.RandomSaltGenerator");
        config.setIvGeneratorClassName("org.jasypt.iv.RandomIvGenerator");
        config.setStringOutputType("base64");
        encryptor.setConfig(config);

        // 4. 執行加密
        String rawPassword = "820201";
        String encryptedPassword = encryptor.encrypt(rawPassword);

        System.out.println("原始密碼: " + rawPassword);
        System.out.println("加密後密文: ENC(" + encryptedPassword + ")");
        
        // 5. 驗證解密 (確保加密正確)
        System.out.println("解密測試: " + encryptor.decrypt(encryptedPassword));
    }
}